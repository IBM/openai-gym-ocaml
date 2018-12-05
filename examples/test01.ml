open Gym_http
open Gym_t

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
