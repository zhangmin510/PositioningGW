package name.zhangmin.gw.io.rest.core.util;

import java.util.ArrayList;
import java.util.Collection;
import java.util.LinkedHashSet;
import java.util.List;

import javax.ws.rs.core.UriBuilder;

import name.zhangmin.gw.core.apps.App;
import name.zhangmin.gw.core.thing.Channel;
import name.zhangmin.gw.core.thing.Thing;
import name.zhangmin.gw.core.thing.link.AppChannelLinkRegistry;
import name.zhangmin.gw.io.rest.core.app.beans.AppBean;
import name.zhangmin.gw.io.rest.core.app.beans.AppResource;
import name.zhangmin.gw.io.rest.core.thing.beans.ChannelBean;
import name.zhangmin.gw.io.rest.core.thing.beans.ThingBean;


public class BeanMapper {

    public static AppBean mapAppToBean(App app, String uriPath) {
    	AppBean bean = new AppBean();

        bean.name = app.getName();
        bean.state = app.getState().toString();
        bean.type = app.getClass().getSimpleName();
        bean.link = UriBuilder.fromUri(uriPath).path(AppResource.PATH_APPS).path(bean.name).build().toASCIIString();
       

        return bean;
    }

    public static ThingBean mapThingToBean(Thing thing, AppChannelLinkRegistry appChannelLinkRegistry) {
        List<ChannelBean> channelBeans = new ArrayList<>();
        for (Channel channel : thing.getChannels()) {
            ChannelBean channelBean = mapChannelToBean(channel, appChannelLinkRegistry);
            channelBeans.add(channelBean);
        }

        String thingUID = thing.getUID().toString();
        
        return new ThingBean();
    }

    public static ChannelBean mapChannelToBean(Channel channel, AppChannelLinkRegistry appChannelLinkRegistry) {
        String boundeApp = appChannelLinkRegistry.getBoundApp(channel.getUID());
        return new ChannelBean(channel.getUID().getId(), channel.getAcceptedAppType().toString(), boundeApp);
    }

    
}
