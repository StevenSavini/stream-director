import React from 'react';
import { browserHistory, Link } from 'react-router';

const DiscussionShow = (props) => {
 const { title, description} = props
 return(
   <div className="discussion-group">
     <p className="discussion-title">{title}</p>
     <p className="discussion-description">{description}</p>
   </div>
)}

export default DiscussionShow;
