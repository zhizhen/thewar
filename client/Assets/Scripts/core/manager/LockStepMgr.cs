using System.Collections;
using System.Collections.Generic;
using System;
using UnityEngine;


public class LockStepMgr : MonoBehaviourExt
{

	public static LockStepMgr Instance;
	public int numberOfPlayers = 2;
	public int TurnID = 0;
	private float TurnLength = 0.2f; //200 miliseconds
	private int GameFramesPerLocksetpTurn = 4;
	private int GameFramesPerSecond = 20;
	private int GameFrame = 0;
	private float AccumilatedTime = 0f;
	private float FrameLength = 0.05f; //50 miliseconds

	private Queue<IAction> actionsToSync; //需要进行同步的Action
	private PendingActions pendingActions; //即将要同步的Action
	private ConfirmedActions confirmedActions;

	void Awake () {
		Instance = this;
		actionsToSync = new Queue<IAction>();
		pendingActions = new PendingActions(this);
		confirmedActions = new ConfirmedActions (this);
	}

	public void Update () {
		//Basically same logic as FixedUpdate, but we can scale it by adjusting FrameLength
		AccumilatedTime = AccumilatedTime + Time.deltaTime;

		//in case the FPS is too slow, we may need to update the game multiple times a frame
		while(AccumilatedTime > FrameLength) {
			GameFrameTurn ();
			AccumilatedTime = AccumilatedTime - FrameLength;
		}
	}

	private void GameFrameTurn() {
		//first frame is used to process actions
		if (GameFrame == 0) {
			if (LockStepTurn ()) {
				GameFrame++;
			}
		} else {
			// update game

			GameFrame++;
			if (GameFrame == GameFramesPerLocksetpTurn)
				GameFrame = 0;
		}
	}

	private bool LockStepTurn() {
		Debug.Log ("锁帧， turn id: " + TurnID);
		//Check if we can process with the next turn
		bool nextTurn = NextTurn();
		if (nextTurn) {
			SendPendingAction ();
			//the first and second lockstep turn will not be ready to process yet
			if(TurnID >= 3) {
				ProcessActions ();
			}
		}
		//otherwise wait another turn to recieve all input from all players

		return nextTurn;
	}

	private bool NextTurn() {

		if(confirmedActions.ReadyForNextTurn() && pendingActions.ReadyForNextTurn()) {
			//increment the turn ID
			TurnID++;
			//move the confirmed actions to next turn
			confirmedActions.NextTurn();
			//move the pending actions to this turn
			pendingActions.NextTurn();

			return true;
		}

		return false;
	}

	private void SendPendingAction() {
		IAction action = null;
		if(actionsToSync.Count > 0) {
			action = actionsToSync.Dequeue();
		}
		//if no action for this turn, send the NoAction action
		if(action == null) {
			action = new NoAction();
		}
		//add action to our own list of actions to process
		pendingActions.AddAction(action, 1, TurnID, TurnID);
		//confirm our own action
		confirmedActions.playersConfirmedCurrentAction.Add (RoleMgr.Instance.RoleId);
		//send action to all other players
		//		nv.RPC("RecieveAction", RPCMode.Others, LockStepTurnID, Network.player.ToString(), BinarySerialization.SerializeObjectToByteArray(action));

		ActionController.Instance.SyncAction(TurnID, RoleMgr.Instance.RoleId, BinarySerialization.SerializeObjectToByteArray(action));
	}

	private void ProcessActions() {
//		for (int i = 0; i < pendingActions.CurrentActions.Count; i++) {
//			IAction action = pendingActions.CurrentActions [i];
//			action.ProcessAction ();
//		}
		foreach(var item in pendingActions.CurrentActions) {
			item.Value.ProcessAction ();
//			action.ProcessAction();
		}
	}

	public void AddAction(IAction action) {
		//log.Debug ("Action Added");
//		if(!initialized) {
//			log.Debug("Game has not started, action will be ignored.");
//			return;
//		}
		actionsToSync.Enqueue(action);
	}

	public void SyncAction(int turnid, int roleid, IAction action) {
		if(action == null) {
			Debug.Log ("Sending action failed");
			//TODO: Error handle invalid actions recieve
		} else {
			pendingActions.AddAction(action, 2, turnid, turnid);

//			//send confirmation
//			if(Network.isServer) {
//				//we don't need an rpc call if we are the server
//				ConfirmActionServer (turnid, Network.player.ToString(), playerID);
//			} else {
//				nv.RPC ("ConfirmActionServer", RPCMode.Server, lockStepTurn, Network.player.ToString(), playerID);
//			}
		}
	}
}
