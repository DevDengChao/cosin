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
package com.cskefu.cc.aspect;

import com.cskefu.cc.exception.BillingQuotaException;
import com.cskefu.cc.exception.BillingResourceException;
import com.cskefu.cc.model.User;
import org.apache.commons.lang3.StringUtils;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

@Aspect
@Component
public class UserAspect {

    private final static Logger logger = LoggerFactory.getLogger(UserAspect.class);

    @Before("execution(* com.cskefu.cc.persistence.repository.UserRepository.save(..))")
    public void beforeSave(final JoinPoint joinPoint) throws BillingResourceException, BillingQuotaException {
        final User user = (User) joinPoint.getArgs()[0];
        logger.info("[save] before user id {}", user.getId());
        if (StringUtils.isBlank(user.getId())) {
            // 执行配额扣除
        } else {
            // update existed user
        }
    }
}
