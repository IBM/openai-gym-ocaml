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

let base_url = ref "http://rl_server:5000"

let env_create env_id =
  let method_ = "/v1/envs/" in
  let req = Yojson.Basic.to_string (`Assoc [ "env_id", `String env_id ]) in
  let rsp = Rest.post !base_url method_ req in
  Json.get_string (Yojson.Basic.from_string rsp) "instance_id"

let env_list_all () =
  let method_ = "/v1/envs/" in
  let params = Rest.parameters_of_json `Null in
  let rsp = Rest.get !base_url method_ params in
  begin match Json.get (Yojson.Basic.from_string rsp) "all_envs" with
  | Some (`Assoc l) ->
      Some
        (List.map
           (fun (instance_id, env_id) ->
              begin match env_id with
              | `String env_id -> (instance_id, env_id)
              | _ -> Format.eprintf "XXXXXXXXX %s@." rsp; assert false
              end)
           l)
  | _ -> None
  end
