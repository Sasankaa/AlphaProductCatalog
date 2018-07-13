<%-- 
    Document   : main
    Created on : Jul 12, 2018, 6:25:56 AM
    Author     : sasanka
--%>

<%@page import="java.util.*, com.oracle.WSClient,com.oracle.Tweets,com.oracle.Tweet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link rel="stylesheet" type="text/css" href="css/alpha.css" />
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
        <title>Alpha Office Page</title>
    </head>
    <body>
        <div id="title">
            <h1>Alpha Office Supply</h1>
        </div>
        <br>
        <br>
        <br>


        <% List<Tweet> tweet = WSClient.requestItem().tweets;
            for (int i = 0; i < tweet.size(); i++) {
                Tweet twt = tweet.get(i); %>  

        <!-- close the loop -->
        <table class="tweetTable">
            <tr>
                <td class="tweetRow1LeftTd">
                    <span class="tweetNameSpan"><% out.print(twt.user.getName()); %></span><br /><span class="tweetScreennameSpan"><% out.print("@"+twt.user.getScreen_name()); %></span></td>
                <td class="tweetRow1MiddleTd"><img src="Images/blueACircle.png" class="blueACircle" title="Part of the AlphaOffice Big Data Initiative"/></td>
                <td class="tweetRow1RightTd">
                    <label onclick="window.open('https://twitter.com/<% out.print(twt.user.getScreen_name()); %>', '_blank');" class="tweetFollowButton" title="Follow">
                        <img src="Images/twitterBlue.png" />Follow
                    </label>
                </td>
            </tr>
            <tr>
                <td colspan="3" class="tweetRow2Td"><% out.print(twt.getText()); %></td>
            </tr>
            <tr>
                <td colspan="3" class="tweetRow3Td"><% out.print(twt.getCreated_at()); %></td>
            </tr>
            <tr>
                <td colspan="3" class="tweetRow4Td">
                    <!--                    <div class="repliesLikesDiv">
                                            <img src="Images/twitterReply.png" title="Reply" />~REPLIES~
                                            <img src="Images/twitterRetweet.png" title="Retweet" />~RETWEETS~
                                            <img src="Images/twitterLike.png" title="Like" />~LIKES~
                                        </div>-->
                </td>
            </tr>
        </table>

        <% }%>

    </body>
</html>
