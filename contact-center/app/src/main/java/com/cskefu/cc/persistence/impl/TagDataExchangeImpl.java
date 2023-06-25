/*
 * Copyright (C) 2023 Beijing Huaxia Chunsong Technology Co., Ltd.
 * <https://www.chatopera.com>, Licensed under the Chunsong Public
 * License, Version 1.0  (the "License"), https://docs.cskefu.com/licenses/v1.html
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package com.cskefu.cc.persistence.impl;

import com.cskefu.cc.model.Tag;
import com.cskefu.cc.persistence.interfaces.DataExchangeInterface;
import com.cskefu.cc.persistence.repository.TagRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.Serializable;
import java.util.List;

@Service("tagdata")
public class TagDataExchangeImpl implements DataExchangeInterface {
    @Autowired
    private TagRepository tagRes;

    public String getDataById(String id) {
        Tag tag = tagRes.getReferenceById(id);
        return tag != null ? tag.getTag() : id;
    }

    @Override
    public List<Serializable> getListDataById(String id, String creater) {
        return null;
    }

    public void process(Object data) {

    }
}
