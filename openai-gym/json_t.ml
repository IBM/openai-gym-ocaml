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

type safe = Yojson.Safe.t
type basic = Yojson.Basic.t
type json = basic
type lexer_state = Yojson.Basic.lexer_state
type bi_outbuf_t = Buffer.t

let write_json = Yojson.Basic.write_t
let read_json = Yojson.Basic.read_t
let to_string j = Yojson.Basic.to_string j

