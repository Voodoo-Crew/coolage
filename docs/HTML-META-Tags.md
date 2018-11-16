# HTML Meta Tags List #

## TITLE HTML Tag ##

```html
<title>between 50 to 65 characters including spaces</title>
```

## Basic HTML Meta Tags ##

```html
<meta charset="utf-8" />

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Expires" content="0" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Cache-Control" content="no-cache" />
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />

<meta name="keywords" content="This tag is ignored by Google and Bing" />
<meta name="description" content="between 50–300 characters" />
<meta name="subject" content="website's subject" />
<meta name="copyright"content="company name" />
<meta name="language" content="en" />
<meta name="robots" content="index,follow,archive" />
<meta name="revised" content="Monday, November 5th, 2018, 09:15 am" />
<meta name="abstract" content="" />
<meta name="topic" content="" />
<meta name="summary" content="" />
<meta name="Classification" content="Business" />
<meta name="author" content="name, email@hotmail.com" />
<meta name="designer" content="" />
<meta name="copyright" content="" />
<meta name="reply-to" content="email@hotmail.com" />
<meta name="owner" content="" />
<meta name="url" content="http://www.websiteaddrress.com" />
<meta name="identifier-URL" content="http://www.websiteaddress.com" />
<meta name="directory" content="submission" />
<meta name="category" content="" />
<meta name="coverage" content="Worldwide" />
<meta name="distribution" content="Global" />
<meta name="rating" content="General" />
<meta name="revisit-after" content="7 days" />
```

## OpenGraph Meta Tags ##

```html
<meta name="og:title" content="The Rock" />
<meta name="og:type" content="movie" />
<meta name="og:url" content="http://www.imdb.com/title/tt0117500/" />
<meta name="og:image" content="https://m.media-aws.com/images/M/MV5BMT._V1_.jpg" />
<meta name="og:site_name" content="IMDb" />
<meta name="og:description" content="Movie description goes here ..." />

<meta name="fb:page_id" content="98765432100" />

<meta name="og:email" content="me@example.com" />
<meta name="og:phone_number" content="044-123-4567" />
<meta name="og:fax_number" content="+38-044-123-4567" />

<meta name="og:latitude" content="50.4405085" />
<meta name="og:longitude" content="30.489679" />
<meta name="og:street-address" content="Vokzal'na Square" />
<meta name="og:locality" content="Kyiv" />
<meta name="og:region" content="Kyivs'ka obl." />
<meta name="og:postal-code" content="01001" />
<meta name="og:country-name" content="UA" />

<meta property="og:type" content="game.achievement" />
<meta property="og:points" content="POINTS_FOR_ACHIEVEMENT" />
<meta property="og:see_also" content="https://site-mirror.com" />

<meta property="og:video" content="http://example.com/awesome.swf" />
<meta property="og:video:height" content="640" />
<meta property="og:video:width" content="385" />
<meta property="og:video:type" content="application/x-shockwave-flash" />

<meta property="og:video" content="http://example.com/html5.mp4" />
<meta property="og:video:type" content="video/mp4" />

<meta property="og:video" content="http://example.com/fallback.vid" />
<meta property="og:video:type" content="text/html" />

<meta property="og:audio" content="http://example.com/amazing.mp3" />
<meta property="og:audio:title" content="Amazing Song" />
<meta property="og:audio:artist" content="Amazing Band" />
<meta property="og:audio:album" content="Amazing Album" />
<meta property="og:audio:type" content="application/mp3" />
```

## Custom Meta Tags ##

Use custom meta tags to store data that you need in javascript, instead of hard-coding that data into your javascript.
Here's some examples:

```html
<meta name="google-analytics" content="UA-XXXXX-Y" />
<meta name="disqus" content="some-content" />
<meta name="uservoice" content="some-content" />
<meta name="mixpanel" content="some-content" />
```

## Company/Service Meta Tags ##

#### ClaimID ####

```html
<meta name="microid" content="mailto+http:sha1:15b5a734b13a428c9d959b7ad156cc9bb671672d" />
```

#### Apple Meta Tags ####

```html
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="apple-touch-fullscreen" content="yes" />
<meta name="apple-mobile-web-app-status-bar-style" content="black" />
<meta name="format-detection" content="telephone=no" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
```

#### Internet Explorer Meta Tags ####

```html
<meta http-equiv="Page-Enter" content="RevealTrans(Duration=2.0,Transition=2)" />
<meta http-equiv="Page-Exit" content="RevealTrans(Duration=3.0,Transition=12)" />
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />

<meta name="mssmarttagspreventparsing" content="true" />
<meta name="msapplication-starturl" content="http://your-domain.com/about/" />
<meta name="msapplication-window" content="width=800;height=600" />
<meta name="msapplication-navbutton-color" content="red" />
<meta name="application-name" content="John Doe Front-end Developer" />
<meta name="msapplication-tooltip" content="Launch A Cool Blog" />
<meta name="msapplication-task" content="name=About;action-uri=/about/;icon-uri=/images/about.ico" />
<meta name="msapplication-task" content="name=The Big List;action-uri=/the-big-list-of-javascript-css-and-html-development-tools/;icon-uri=/images/list_links.ico" />
<meta name="msapplication-task" content="name=jQuery Posts;action-uri=/category/jquery/;icon-uri=/images/jquery.ico" />
<meta name="msapplication-task" content="name=Start Developing;action-uri=/category/javascript/;icon-uri=/images/script.ico" />

<link rel="shortcut icon" href="/images/favicon.ico" />
```

#### TweetMeme Meta Tags ####

```html
<meta name="tweetmeme-title" content="Retweet Button Explained" />
```

#### Blog Catalog Meta Tags ####

```html
<meta name="blogcatalog" />
```

#### Rails Meta Tags ####

```html
<meta name="csrf-param" content="authenticity_token" />
<meta name="csrf-token" content="/aHR0cHM6Ly9naXRodWIuY29tL3RiYWx0cnVzaGFpdGlzCg==" />
```

#### Apple Tags ####

```html
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="apple-mobile-web-app-status-bar-style" content="black" />

<meta name="format-detection" content="telephone=no" />

<meta name="viewport" content="width=320, initial-scale=2.3, user-scalable=no" />
<meta name="viewport" content="width=device-width" />
<meta name="viewport" content="initial-scale=1.0" />
<meta name="viewport" content="initial-scale=2.3, user-scalable=no" />

<link rel="apple-touch-startup-image" href="/startup.png" />
<link rel="apple-touch-icon" href="touch-icon-iphone.png" />
<link rel="apple-touch-icon" href="touch-icon-ipad.png" sizes="72x72" />
<link rel="apple-touch-icon" href="touch-icon-iphone4.png" sizes="114x114" />
<link rel="apple-touch-icon" href="/apple-touch-icon.png" type="image/png" />
```

## HTML Link Tags ##

```html
<link rel="shortcut icon" type="image/ico" href="/favicon.ico" />
<link rel="fluid-icon" type="image/png" href="/fluid-icon.png" />

<link rel="alternate" type="application/rss+xml" title="RSS" href="http://feeds.your-domain.com/atom" />
<link rel="me" type="text/html" href="http://google.com/profiles/your-profile-page" />
<link rel="shortlink" href="http://your-domain.com/?p=353" />
<link rel="archives" title="May 2003" href="http://your-domain.com/2018/05/" />
<link rel="index" title="DeWitt Clinton" href="http://your-domain.net/" />
<link rel="start" title="Number one company" href="http://your-domain.net/articles/about-us/" />
<link rel="prev" title="From where you start." href="http://your-domain.net/articles/from-where-you-start/" />
<link rel="next" title="Next steps" href="http://your-domain.net/meta/next-steps/" />
<link rel="search" title="Rocketbomb" href="/search.xml" type="application/opensearchdescription+xml" />

<link rel="self" type="application/atom+xml" href="http://www.your-domain.com/atomFeed.php?page=3" />
<link rel="first" href="http://www.your-domain.com/atomFeed.php" />
<link rel="next" href="http://www.your-domain.com/atomFeed.php?page=4" />
<link rel="previous" href="http://www.your-domain.com/atomFeed.php?page=2" />
<link rel="last" href="http://www.your-domain.com/atomFeed.php?page=147" />

<link rel="shortlink" href="http://your-domain.com/?p=43625" />
<link rel="canonical" href="http://your-domain.com/2018/06/11-html-tips-you-should-know.html" />
<link rel="EditURI" href="http://your-domain.com/xmlrpc.php?rsd" type="application/rsd+xml" title="RSD" />
<link rel="pingback" href="http://your-domain.com/xmlrpc.php" />
<link rel="stylesheet" href="http://wordpress.org/style/iphone.css" media="only screen and (max-device-width: 480px)" type="text/css" />
```

---

## Credits ##

- [Web Fundamentals](https://developers.google.com/web/)
- [Apple Meta Tags](https://developer.apple.com/library/archive/documentation/AppleApplications/Reference/SafariHTMLRef/Articles/MetaTags.html)
- [OpenGraph Meta Tags](http://opengraphprotocol.org/)
- [Link Tag Meaning](http://intertwingly.net/wiki/pie/LinkTagMeaning)

---

:scorpius:
