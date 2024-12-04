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
package com.cskefu.cc.controller.admin;

import com.chatopera.store.sdk.exceptions.InvalidRequestException;
import com.cskefu.cc.basic.Constants;
import com.cskefu.cc.controller.Handler;
import com.cskefu.cc.exception.MetaKvInvalidKeyException;
import com.cskefu.cc.model.User;
import com.cskefu.cc.util.Menu;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.validation.Valid;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/admin/license")
public class LicenseController extends Handler {
    private final static Logger logger = LoggerFactory.getLogger(LicenseController.class);

    @RequestMapping("/index")
    @Menu(type = "admin", subtype = "licenseList")
    public ModelAndView index(ModelMap map, HttpServletRequest request) {
        User user = super.getUser(request);
        if (user.isSuperadmin()) {
            List<JSONObject> licenses = new ArrayList<>();
            map.addAttribute(Constants.UPDATETIME, new Date());
            map.addAttribute(Constants.LICENSES, licenses);
            map.addAttribute(Constants.LICENSESTOREPROVIDER, "https://store.chatopera.com");
            return request(super.createView("/admin/license/index"));
        } else {
            return request(super.createView("/public/error"));
        }
    }

    @RequestMapping("/add")
    @Menu(type = "admin", subtype = "licenseList")
    public ModelAndView add(ModelMap map, HttpServletRequest request) {
        User user = super.getUser(request);
        if (user.isSuperadmin()) {
            return request(super.createView("/admin/license/add"));
        } else {
            return request(super.createView("/public/error"));
        }
    }

    /**
     * 保存新的证书
     *
     * @param map
     * @param request
     * @param licenseShortId
     * @return
     */
    @RequestMapping("/save")
    @Menu(type = "admin", subtype = "licenseList")
    public ModelAndView save(ModelMap map,
                             HttpServletRequest request,
                             @Valid String licenseShortId) throws MetaKvInvalidKeyException, InvalidRequestException {
        User user = super.getUser(request);
        logger.info("[save] licenseShortId {}", licenseShortId);
        String msg = "";

        if (user.isSuperadmin()) {
            return request(super.createView("/admin/license/index"));
        } else {
            return request(super.createView("/public/error"));
        }
    }

    @RequestMapping("/delete/{licenseShortId}")
    @Menu(type = "admin", subtype = "licenseList")
    public ModelAndView delete(ModelMap map,
                               HttpServletRequest request,
                               @PathVariable String licenseShortId) throws MetaKvInvalidKeyException {
        User user = super.getUser(request);
        logger.info("[delete] licenseShortId {}", licenseShortId);
        String msg = "";

        if (user.isSuperadmin()) {
            return request(super.createView("/admin/license/index"));
        } else {
            return request(super.createView("/public/error"));
        }
    }

    @RequestMapping("/instance")
    @Menu(type = "admin", subtype = "licenseInst")
    public ModelAndView getInstanceInfo(ModelMap map, HttpServletRequest request) {
        User user = super.getUser(request);
        if (user.isSuperadmin()) {
            return request(super.createView("/admin/license/instance"));
        } else {
            return request(super.createView("/public/error"));
        }
    }
}
