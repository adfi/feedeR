context("RSS")

# A sample RSS feed:
#
document = '<?xml version="1.0" encoding="windows-1252"?>
<rss version="2.0">
<channel>
<title>Sample Feed - Favorite RSS Related Software &amp; Resources</title>
<description>Take a look at some of FeedForAll&apos;s favorite software and resources for learning more about RSS.</description>
<link>http://www.feedforall.com</link>
<category domain="www.dmoz.com">Computers/Software/Internet/Site Management/Content Management</category>
<copyright>Copyright 2004 NotePage, Inc.</copyright>
<docs>http://blogs.law.harvard.edu/tech/rss</docs>
<language>en-us</language>
<lastBuildDate>Mon, 1 Nov 2004 13:17:17 -0500</lastBuildDate>
<managingEditor>marketing@feedforall.com</managingEditor>
<pubDate>Tue, 26 Oct 2004 14:06:44 -0500</pubDate>
<webMaster>webmaster@feedforall.com</webMaster>
<generator>FeedForAll Beta1 (0.0.1.8)</generator>
<image>
<url>http://www.feedforall.com/feedforall-temp.gif</url>
<title>FeedForAll Sample Feed</title>
<link>http://www.feedforall.com/industry-solutions.htm</link>
<description>FeedForAll Sample Feed</description>
<width>144</width>
<height>117</height>
</image>
<item>
<title>RSS Resources</title>
<description>Our favorite RSS Resources</description>
<link>http://www.feedforall.com</link>
<pubDate>Tue, 26 Oct 2004 14:01:01 -0500</pubDate>
</item>
<item>
<title>Example of empty description</title>
<description></description>
<link>http://www.feedforall.com</link>
<pubDate>Wed, 15 Jul 2020 17:27:00 +0100</pubDate>
</item>
</channel>
</rss>'

test_that("parse RSS feed", {
  feed <<- feed_read(document)
  expect_is(feed, "list")
})

test_that("identify RSS feed", {
  expect_equal(feed_type(feed), "RSS")
})

test_that("feed which requires valid User-Agent", {
  expect_is(feed.extract("https://www.glassdoor.com/rss/reviews.rss?id=7745"), "list")
})

test_that("feed is parsed correctly", {
  parsed <- parse.rss(feed)
  expect_is(parsed, "list")
  expect_equal(parsed$title, "Sample Feed - Favorite RSS Related Software & Resources")
  expect_null(parsed$link) # should this be NULL?
  # not testing date as that is tested with the parse.date function
  expect_equal(dim(parsed$items), c(2,4))
})


