/*
 * Copyright (C) 2023 Beijing Huaxia Chunsong Technology Co., Ltd. 
 * <https://www.chatopera.com>, Licensed under the Chunsong Public 
 * License, Version 1.0  (the "License"), https://docs.cskefu.com/licenses/v1.html
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 * Copyright (C) 2018- Jun. 2023 Chatopera Inc, <https://www.chatopera.com>,  Licensed under the Apache License, Version 2.0, 
 * http://www.apache.org/licenses/LICENSE-2.0
 * Copyright (C) 2017 优客服-多渠道客服系统,  Licensed under the Apache License, Version 2.0, 
 * http://www.apache.org/licenses/LICENSE-2.0
 */
package com.cskefu.cc.persistence.repository;

import com.cskefu.cc.model.CousultInvite;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.Collection;
import java.util.List;

public interface ConsultInviteRepository extends JpaRepository<CousultInvite, String> {
    @Query(nativeQuery = true, value = "SELECT * from uk_consult_invite WHERE snsaccountid = ?1 LIMIT 1")
    CousultInvite findBySnsaccountid(@Param("snsaccountid") String Snsaccountid);

    @Query(nativeQuery = true, value = "select ci.`snsaccountid` from  `uk_consult_invite` ci  where ci.`consult_skill_fixed_id` in (?1)")
    List<String> findSNSIdBySkill(Collection<String> skills);

    List<CousultInvite> findAll();
}


