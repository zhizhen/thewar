using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ConfirmedActions
{
	public List<int> playersConfirmedCurrentAction;
	public List<int> playersConfirmedPriorAction;

	private LockStepMgr lsm;

	public ConfirmedActions (LockStepMgr lsm) {
		this.lsm = lsm;
		playersConfirmedCurrentAction = new List<int>(lsm.numberOfPlayers);
		playersConfirmedPriorAction = new List<int>(lsm.numberOfPlayers);
	}

	public void NextTurn() {
		//clear prior actions
		playersConfirmedPriorAction.Clear ();

		List<int> swap = playersConfirmedPriorAction;

		//last turns actions is now this turns prior actions
		playersConfirmedPriorAction = playersConfirmedCurrentAction;

		//set this turns confirmation actions to the empty list
		playersConfirmedCurrentAction = swap;
	}

	public bool ReadyForNextTurn() {
		//check that the action that is going to be processed has been confirmed
		if(playersConfirmedPriorAction.Count == lsm.numberOfPlayers) {
			return true;
		}
		//if 2nd turn, check that the 1st turns action has been confirmed
		if(lsm.TurnID == 1) {
			return playersConfirmedCurrentAction.Count == lsm.numberOfPlayers;
		}
		//no action has been sent out prior to the first turn
		if(lsm.TurnID == 0) {
			return true;
		}
		//if none of the conditions have been met, return false
		return false;
	}
}
