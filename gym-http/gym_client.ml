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

open Gym_t
open Gym_j

let base_url = ref "http://127.0.0.1:5000"

let env_create env_id =
  let method_ = "/v1/envs/" in
  let req = string_of_env_id { env_id = env_id; } in
  let rsp = Rest.post !base_url method_ req in
  instance_id_of_string rsp

let env_list_all () =
  let method_ = "/v1/envs/" in
  let params = Rest.parameters_of_json (`Assoc []) in
  let rsp = Rest.get !base_url method_ params in
  (all_envs_of_string rsp).all_envs
