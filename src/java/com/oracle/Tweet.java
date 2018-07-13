
package com.oracle;


public class Tweet {



    private String created_at;
    public Long id;
    public String idStr;
    private String text;
    public String source;
    public Boolean truncated;
    public Object inReplyToStatusId;
    public Object inReplyToStatusIdStr;
    public Object inReplyToUserId;
    public Object inReplyToUserIdStr;
    public Object inReplyToScreenName;
    public User user;
    public Object geo;
    public Object coordinates;
    public Object place;
    public Object contributors;
    public Boolean isQuoteStatus;
    public Integer retweet_count;
    public Integer favorite_count;
    public Entities entities;
    public Boolean favorited;
    public Boolean retweeted;
    public Boolean possiblySensitive;
    public String filterLevel;
    public String lang;
    public String timestampMs;
/**
     * @return the created_at
     */
    public String getCreated_at() {
        return created_at;
    }
 /**
     * @return the text
     */
    public String getText() {
        return text;
    }
   
}
