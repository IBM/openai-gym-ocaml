open Gym_http
open Gym_t
open Gym_j

let instance_id =
  Format.printf "-------------------------------@.";
  Format.printf "Test env_create@.";
  let instance_id = Gym_client.env_create "CartPole-v0" in
  Format.printf "%s@." instance_id.instance_id;
  instance_id

let () =
  Format.printf "-------------------------------@.";
  Format.printf "Test env_list_all@.";
  let envs = Gym_client.env_list_all () in
  List.iter
    (fun (instance_id, env_id) ->
       Format.printf "  %s: %s@." instance_id env_id)
    envs

let () =
  Format.printf "-------------------------------@.";
  Format.printf "Test env_reset@.";
  let obs = Gym_client.env_reset instance_id.instance_id in
  Format.printf "observation = %s@." (string_of_json obs.observation)

let () =
  Format.printf "-------------------------------@.";
  Format.printf "Test env_step@.";
  let resp = Gym_client.env_step instance_id.instance_id 0 false in
  Format.printf "resp = %s@." (string_of_step_response resp)

let () =
  Format.printf "-------------------------------@.";
  Format.printf "Test env_action_space_info@.";
  let resp = Gym_client.env_action_space_info instance_id.instance_id in
  Format.printf "resp = %s@." (string_of_json resp)

let () =
  Format.printf "-------------------------------@.";
  Format.printf "Test env_action_space_sample@.";
  let resp = Gym_client.env_action_space_sample instance_id.instance_id in
  Format.printf "action = %s@." (string_of_json resp)

let () =
  Format.printf "-------------------------------@.";
  Format.printf "Test env_action_space_contains@.";
  let resp = Gym_client.env_action_space_contains instance_id.instance_id 0 in
  Format.printf "member = %s@." (string_of_bool resp)
