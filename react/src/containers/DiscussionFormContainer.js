import React, { Component } from 'react';
import DescriptionField from '../components/DescriptionField';
import TitleField from '../components/TitleField';
class DiscussionFormContainer extends Component {
  constructor(props) {
    super(props)
    this.state = {
      discussionTitle: '',
      discussionDescription: '',

    }
    this.discussionTitleHandle=this.discussionTitleHandle.bind(this);
    this.discussionDescriptionHandle=this.discussionDescriptionHandle.bind(this);
    this.handleClearForm=this.handleClearForm.bind(this);
    this.handleFormSubmit=this.handleFormSubmit.bind(this);
  }
  discussionTitleHandle(event) {
    event.preventDefault();
    this.setState({ discussionTitle: event.target.value })
  }

  discussionDescriptionHandle(event) {
    event.preventDefault();
    this.setState({ discussionDescription: event.target.value })
  }

  handleClearForm(event) {
    event.preventDefault();
    this.setState({
      discussionTitle: '',
      discussionDescription: ''
    })
  }

  handleFormSubmit(event) {
    event.preventDefault()
    let protoPayload = {
      title: this.state.discussionTitle,
      description: this.state.discussionDescription,
      group_id: this.props.groupId
    };
    let formPayload = JSON.stringify(protoPayload);
    this.props.addNewDiscussion(formPayload);
    this.handleClearForm(event);
  }

  render() {

    return(
      <form className="new-discussion-form callout" onSubmit={this.handleFormSubmit}>
        <TitleField
          content={this.state.discussionTitle}
          label="Discussion Title"
          name="discussion-title"
          changeHandle={this.discussionTitleHandle}
        />
      <DescriptionField
          content={this.state.discussionDescription}
          label="Discussion"
          name="discussion-description"
          changeHandle={this.discussionDescriptionHandle}
        />

        <div className="button-group">
          <button className="button" onClick={this.handleClearForm}>Clear</button>
          <input className="button" type="submit" value="Submit" />
        </div>
      </form>
    )
  }
}

export default DiscussionFormContainer;
