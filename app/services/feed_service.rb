class FeedService
  def self.prepare_feed(size)
    output_array = []
    feed_object = {}
    events =  Merit::ActivityLog.where(related_change_type: 'Merit::BadgesSash').reverse[0..size]
    events.each do |event|
      event_instance = event['description']
      date_time = event['created_at']
      action_step =event['action_id']
      user_id = Merit::Action.find(action_step)['user_id']
      user = User.find(user_id)
      if user.first_name == nil || user.last_name == nil
        user_name_or_id =  user.id
      else
        user_name_or_id = user.first_name + ' ' + user.last_name
      end
      feed_object = {'user'=>user_name_or_id,'event'=>event_instance,'date-time'=>date_time}
      output_array.push(feed_object)
    end
    output_array
  end
end
# When rending the feed service in a few, follow the pattern of 
# <% feed = FeedService.prepare_feed(4) %>
# <% feed.each do |x| %>
# <%= "#{x['user']} was #{x['event']} on #{x['date-time'].to_time.strftime('%B %e at %l:%M %p')}." %>
# <br/>
# <% end %>
