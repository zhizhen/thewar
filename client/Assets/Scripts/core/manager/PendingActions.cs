using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PendingActions
{
	public Dictionary<int, IAction> CurrentActions;
	private Dictionary<int, IAction> NextActions;
	private Dictionary<int, IAction> NextNextActions;
	//incase other players advance to the next step and send their action before we advance a step
	private Dictionary<int, IAction> NextNextNextActions;

	private int currentActionsCount;
	private int nextActionsCount;
	private int nextNextActionsCount;
	private int nextNextNextActionsCount;

	LockStepMgr lsm;

	public PendingActions (LockStepMgr lsm) {
		this.lsm = lsm;

//		CurrentActions = new IAction[lsm.numberOfPlayers];
//		NextActions = new IAction[lsm.numberOfPlayers];
//		NextNextActions = new IAction[lsm.numberOfPlayers];
//		NextNextNextActions = new IAction[lsm.numberOfPlayers];


		CurrentActions = new Dictionary<int, IAction>();
		NextActions = new Dictionary<int, IAction>();
		NextNextActions = new Dictionary<int, IAction>();
		NextNextNextActions = new Dictionary<int, IAction>();

		currentActionsCount = 0;
		nextActionsCount = 0;
		nextNextActionsCount = 0;
		nextNextNextActionsCount = 0;
	}

	public void AddAction(IAction action, int playerID, int currentLockStepTurn, int actionsLockStepTurn) {
		//add action for processing later
		if(actionsLockStepTurn == currentLockStepTurn + 1) {
			//if action is for next turn, add for processing 3 turns away
			if(NextNextNextActions[playerID] != null) {
				//TODO: Error Handling
				Debug.Log ("WARNING!!!! Recieved multiple actions for player " + playerID + " for turn "  + actionsLockStepTurn);
			}
			NextNextNextActions[playerID] = action;
			nextNextNextActionsCount++;
		} else if(actionsLockStepTurn == currentLockStepTurn) {
			//if recieved action during our current turn
			//add for processing 2 turns away
			if(NextNextActions[playerID] != null) {
				//TODO: Error Handling
				Debug.Log ("WARNING!!!! Recieved multiple actions for player " + playerID + " for turn "  + actionsLockStepTurn);
			}
			NextNextActions[playerID] = action;
			nextNextActionsCount++;
		} else if(actionsLockStepTurn == currentLockStepTurn - 1) {
			//if recieved action for last turn
			//add for processing 1 turn away
			if(NextActions[playerID] != null) {
				//TODO: Error Handling
				Debug.Log ("WARNING!!!! Recieved multiple actions for player " + playerID + " for turn "  + actionsLockStepTurn);
			}
			NextActions[playerID] = action;
			nextActionsCount++;
		} else {
			//TODO: Error Handling
			Debug.Log ("WARNING!!!! Unexpected lockstepID recieved : " + actionsLockStepTurn);
			return;
		}
	}

	public void NextTurn() {
		//Finished processing this turns actions - clear it
		for(int i=0; i<CurrentActions.Count; i++) {
			CurrentActions[i] = null;
		}
		Dictionary<int, IAction> swap = CurrentActions;

		//last turn's actions is now this turn's actions
		CurrentActions = NextActions;
		currentActionsCount = nextActionsCount;

		//last turn's next next actions is now this turn's next actions
		NextActions = NextNextActions;
		nextActionsCount = nextNextActionsCount;

		NextNextActions = NextNextNextActions;
		nextNextActionsCount = nextNextNextActionsCount;

		//set NextNextNextActions to the empty list
		NextNextNextActions = swap;
		nextNextNextActionsCount = 0;
	}

	public bool ReadyForNextTurn() {
		if(nextNextActionsCount == lsm.numberOfPlayers) {
			//if this is the 2nd turn, check if all the actions sent out on the 1st turn have been recieved
			if(lsm.TurnID == 1) {
				return true;
			}

			//Check if all Actions that will be processed next turn have been recieved
			if(nextActionsCount == lsm.numberOfPlayers) {
				return true;
			}
		}

		//if this is the 1st turn, no actions had the chance to be recieved yet
		if(lsm.TurnID == 0) {
			return true;
		}
		//if none of the conditions have been met, return false
		return false;
	}
}
