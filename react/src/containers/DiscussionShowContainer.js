import React, { Component } from 'react';
import DiscussionShow from '../components/DiscussionShow';
import DiscussionFormContainer from './DiscussionFormContainer';

class DiscussionShowContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      discussions: [],
    }
    this.addNewDiscussion = this.addNewDiscussion.bind(this)
  }

  componentDidMount() {
    let groupId = this.props.params.id;
    fetch(`/api/v1/groups/${groupId}`)
      .then(response => response.json())
      .then(responseData => {
        this.setState({
          discussions: [...this.state.discussions, ...responseData.discussions]
        })
      })
  }

  addNewDiscussion(discussion) {
    fetch('/api/v1/discussions.json', {
      credentials: 'same-origin',
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: discussion
    })
    .then(response => response.json())
  .then(responseData => {
    console.log(responseData)
    this.setState({ discussions: [...this.state.discussions, responseData.discussions] })
  })
}

  render() {
    let discussions = this.state.discussions.map(discussion => {
      return(
        <DiscussionShow
          id={discussion.id}
          title={discussion.title}
          description={discussion.description}
          key={"discussion" + discussion.id}
          rating={discussion.rating}
         />
      )
    })
    return(
      <div className="small-9 small-centered columns">
        <DiscussionFormContainer
          addNewDiscussion={this.addNewDiscussion}
          groupId={this.props.params.id}
          />
        {discussions.reverse()}
      </div>
    )
  }
}

export default DiscussionShowContainer;
