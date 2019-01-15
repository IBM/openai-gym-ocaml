open Openai_gym
open Gym_t


(** Create a new environment to test an agent. *)
let instance_id =
  Gym_client.env_create "CartPole-v1"

(** Initialize the environment. *)
let init =
  Gym_client.env_reset instance_id

(** Select an action according to an observation of the environment. *)
let random_agent _obs =
  (* sample a random action in the action space of the instance *)
  Gym_client.env_action_space_sample instance_id

(** Simulate the environment using the random agent. *)
let rec simu obs =
  let action = random_agent obs in
  let resp = Gym_client.env_step instance_id action true in
  if resp.step_done = true then ()
  else simu resp.step_observation

(** Launch the simulation. *)
let () = simu init.observation

(** Close the simulation environment. *)
let () = Gym_client.env_close instance_id
