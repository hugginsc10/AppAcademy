import APIUtil from './api_util';
class FollowToggle {
  constructor(el, options) {
    this.$el = $(el);
    this.userID = this.$el.data('user-id') || options.userID;
    this.followState = (this.$el.data('initial-follow-state') ||
                        options.followState);
    this.render();
    this.$el.on('click', this.handleClick.bind(this));
  }
  handleClick(event) {
    event.preventDefault();
    if (this.followState === 'followed') {
      this.followState = 'unfollowing';
      this.render();
      APIUtil.unfollowUser(this.userID).then(() => {
        this.followToggle.followState = 'unfollowed';
        followToggle.render();
      });
    }else if (this.followState === 'unfollowed'){
      this.followState = 'following';
      this.render();
      APIUtil.followUser(this.userID).then(() => {
        followToggle.followState = 'followed';
        followToggle.render();
      });
    }
  }
  render() {
    switch (this.followState) {
      case 'followed':
        this.$el.prop('disabled', false);
        this.$el.html('Unfollow');
        break;
      case 'unfollowed':
        this.$el.prop('disabled', false);
        this.$el.html('Follow');
        break;
        case 'following':
          this.$el.prop('disabled', true);
          this.$el.html('unfollowing');
          break;
    }
  }
}
module.exports = FollowToggle;