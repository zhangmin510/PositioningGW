/**
 * 
 */
package name.zhangmin.gw.core.thing;

import java.util.EventListener;

import name.zhangmin.gw.core.lib.type.State;
import name.zhangmin.gw.core.thing.uid.ChannelUID;

/**
 * {@link ThingListener} can be registered at a {@link Thing} object.
 * 
 * @see Thing#addThingListener(ThingListener)
 * @author ZhangMin.name
 */
public interface ThingListener extends EventListener {

    /**
     * Channel updated is called when the state of a channel was updated.
     * 
     * @param channelUID
     *            unique identifier of a channel
     * @param state
     *            state
     */
    void channelUpdated(ChannelUID channelUID, State state);
}
