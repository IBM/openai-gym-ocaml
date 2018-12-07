(*
 *  This file is part of the gym-http-api OCaml binding project.
 *
 * Copyright 2016-2017 IBM Corporation
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *)

open Gym_j

let base_url = ref "http://127.0.0.1:5000"

let env_create env_id =
  let method_ = "/v1/envs/" in
  let req = string_of_env_id { env_id = env_id; } in
  let rsp = Rest.post !base_url method_ req in
  instance_id_of_string rsp

let env_list_all () =
  let method_ = "/v1/envs/" in
  let params = "" in
  let rsp = Rest.get !base_url method_ params in
  (all_envs_of_string rsp).all_envs

let env_reset instance_id =
  let method_ = "/v1/envs/"^instance_id^"/reset/" in
  let req = "" in
  let rsp = Rest.post !base_url method_ req in
  observation_of_string rsp

let env_step instance_id action render =
  let method_ = "/v1/envs/"^instance_id^"/step/" in
  let req =
    string_of_step_param { step_render = render;
                           step_action = `Int action; }
  in
  let rsp = Rest.post !base_url method_ req in
  step_response_of_string rsp

let env_action_space_info instance_id =
  let method_ = "/v1/envs/"^instance_id^"/action_space/" in
  let params = "" in
  let rsp = Rest.get !base_url method_ params in
  (action_space_response_of_string rsp).action_space_info

let env_action_space_sample instance_id =
  let method_ = "/v1/envs/"^instance_id^"/action_space/sample" in
  let params = "" in
  let rsp = Rest.get !base_url method_ params in
  (action_space_sample_response_of_string rsp).action_space_sample_action

let env_action_space_contains instance_id x =
  let method_ =
    "/v1/envs/"^instance_id^"/action_space/contains/"^(string_of_int x)
  in
  let params = "" in
  let rsp = Rest.get !base_url method_ params in
  (action_space_contains_response_of_string rsp).action_space_contains_member

let env_observation_space_info instance_id =
  let method_ = "/v1/envs/"^instance_id^"/observation_space/" in
  let params = "" in
  let rsp = Rest.get !base_url method_ params in
  (observation_space_response_of_string rsp).observation_space_info

let env_observation_space_contains instance_id params =
  let method_ = "/v1/envs/"^instance_id^"/observation_space/contains" in
  let req = string_of_json params in
  let rsp = Rest.post !base_url method_ req in
  let rsp = observation_space_contains_response_of_string rsp in
  rsp.observation_space_contains_member

let env_monitor_start instance_id directory force resume =
  let method_ = "/v1/envs/"^instance_id^"/monitor/start/" in
  let req =
    string_of_monitor_start_param
      { monitor_directory = directory;
        monitor_force = force;
        monitor_resume = resume;
        monitor_video_callable = false; }
  in
  let _rsp = Rest.post !base_url method_ req in
  assert (_rsp = "");
  ()

let env_monitor_close instance_id =
  let method_ = "/v1/envs/"^instance_id^"/monitor/close/" in
  let req = "" in
  let _rsp = Rest.post !base_url method_ req in
  assert (_rsp = "");
  ()

let env_close instance_id =
  let method_ = "/v1/envs/"^instance_id^"/close/" in
  let req = "" in
  let _rsp = Rest.post !base_url method_ req in
  assert (_rsp = "");
  ()

let shutdown_server () =
  let method_ = "/v1/shutdown/" in
  let req = "" in
  let rsp = Rest.post !base_url method_ req in
  rsp
