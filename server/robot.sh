#!/bin/bash
erl -pa ./ebin -eval "robot_manager:start_link(), robot_manager:login_one()."
