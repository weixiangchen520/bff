import { MidwayConfig, MidwayAppInfo } from '@midwayjs/core';

export default (appInfo: MidwayAppInfo) => {
  return {
    // use for cookie sign key, should change to your own and keep security
    keys: appInfo.name + '_1648727976250_9364',
    egg: {
      port: 7001,
    },
    security: {
      csrf: false,
    },
    orm: {
      type: 'mysql',
      host: '182.92.83.168',
      port: 3306,
      username: 'root',
      password: 'cwxwan12345',
      database: 'portal',
      synchronize: true, // 如果第一次使用，不存在表，有同步的需求可以写 true
      logging: false,
    },
  } as MidwayConfig;
};
