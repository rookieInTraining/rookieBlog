---
title: "Fetch GraphQL query from an Apollo client using APQ - Part 2"
date: 2024-08-10T00:55:00+05:30
draft: false
tags: ["graphql","apollo-graphql","apq","chrome-extensions","debugging","graphql-queries"]
categories: ["test automation"]
series: ["graphl-automation"]
---
<style>
  .img-shadow {
    box-shadow: 0 2px 2px 2px rgba(0, 0, 0, 0.2);
  }
</style>

<div style="text-align: justify">

As discussed in [part-1](/posts/debug-apq-extension-part1) of this blog, when using apollo client one can boost the performance of the graphql queries by using __"Automatic persisted queries" or APQ__. By using APQ, the server caches each requests initiated from the browser against a hash which if not found, forces the web browser to re-send the request with the complete graphql query.

This however, adds an additional overhead in terms of automation (for fast moving development teams). Automation testers are required to:

  * Run the server without APQ
  * Navigate the frontend source code to find the queries (_praying🙏 secretly that it contains minimal fragments!_)
  * Collaborate with the development teams to share the payload

The aforementioned reasons were enough for me to figure out a solution that acts as an enabler for teams and shorten the time to figure out the query.

# Introducing APQ-Debugger
Though still in beta, the sole purpose of APQ-Debugger is to intercept the graphql network requests and force the client to re-send the intercepted network request; this time including the actual query string. So, when used with the chrome extension. The example shared in [part-1](/posts/debug-apq-extension-part1/#apollo-client-and-apq) above becomes:

```json
{
    "operationName": "NotificationsQuery",
    "variables": {
        "k1":"v1",
        "k2":"v2"
    },
    "extensions": {
      "persistedQuery": {
        "version": 1,
        "sha256Hash": "<the same long hash which you would not want on blog sites! but with a twist!>"
      }
    },
    "query": "fragment NotificationAttribute on NotificationAttribute {\n  name\n  value\n  __typename\n}\n\nfragment NotificationBody on NotificationPhrase {\n  accessibilityLabel\n  ...EgdsItems\n  items {\n    __typename\n    text\n    styles\n    ...NotificationLinkNodeWithIcon\n  }\n  ...EgdsTextItems\n  __typename\n}\n\nfragment NotificationContainer on NotificationContainer {\n  layout\n  theme {\n    ...NotificationTheme\n    __typename\n  }\n  view\n  __typename\n}\n\nfragment NotificationTheme on NotificationTheme {\n  ...NotificationBannerTheme\n  ...NotificationCardTheme\n  __typename\n}\n\nfragment NotificationBannerTheme on NotificationBannerTheme {\n  bannerTheme: themeValue\n  __typename\n}\n\nfragment NotificationCardTheme on NotificationCardTheme {\n  cardBorder\n  personalizedTheme\n  themeValue\n  __typename\n}\n\nfragment NotificationContainerLink on NotificationContainerLink {\n  uri {\n    __typename\n    value\n  }\n  target\n  actions {\n    ...NotificationActionFragment\n    __typename\n  }\n  __typename\n}\n\nfragment NotificationDismiss on NotificationDismiss {\n  icon {\n    ...NotificationIcon\n    __typename\n  }\n  actions {\n    ...NotificationActionFragment\n    __typename\n  }\n  __typename\n}\n\nfragment NotificationImage on Image {\n  description\n  url\n  __typename\n}\n\nfragment NotificationLegalText on NotificationPhrase {\n  accessibilityLabel\n  ...NotificationItems\n  ...EgdsTextItems\n  __typename\n}\n\nfragment NotificationLinks on NotificationPhraseLinkNode {\n  id\n  type\n  text\n  uri {\n    __typename\n    value\n  }\n  linkStyle\n  linkTheme\n  styles\n  target\n  icon {\n    ...NotificationIcon\n    __typename\n  }\n  actions {\n    ...NotificationActionFragment\n    __typename\n  }\n  __typename\n}\n\nfragment NotificationSimpleSubBody on NotificationSimpleBody {\n  title {\n    ...TitleParts\n    __typename\n  }\n  __typename\n}\n\nfragment NotificationMultiSubBody on NotificationMultiBody {\n  title {\n    ...TitleParts\n    __typename\n  }\n  body {\n    ...TitleParts\n    __typename\n  }\n  __typename\n}\n\nfragment NotificationMessageCardSubBody on NotificationMessageCard {\n  title {\n    ...TitleParts\n    __typename\n  }\n  body {\n    ...TitleParts\n    __typename\n  }\n  graphicElement {\n    ... on Icon {\n      description\n      id\n      size\n      theme\n      title\n      token\n      withBackground\n      __typename\n    }\n    ... on Mark {\n      description\n      id\n      markSize: size\n      url {\n        ... on HttpURI {\n          relativePath\n          value\n          __typename\n        }\n        __typename\n      }\n      __typename\n    }\n    ... on Illustration {\n      description\n      id\n      link: url\n      __typename\n    }\n    __typename\n  }\n  links {\n    id\n    text\n    type\n    uri {\n      value\n      __typename\n    }\n    linkStyle\n    linkTheme\n    target\n    actions {\n      ...NotificationActionFragment\n      __typename\n    }\n    __typename\n  }\n  layout\n  __typename\n}\n\nfragment NotificationSwitch on EGDSStandardSwitch {\n  enabled\n  checked\n  checkedLabel\n  checkedDescription\n  checkedAccessibilityLabel\n  uncheckedLabel\n  uncheckedDescription\n  uncheckedAccessibilityLabel\n  label\n  checkedAnalytics {\n    referrerId\n    linkName\n    __typename\n  }\n  uncheckedAnalytics {\n    referrerId\n    linkName\n    __typename\n  }\n  __typename\n}\n\nfragment NotificationTitle on NotificationPhrase {\n  accessibilityLabel\n  completeText\n  ...EgdsItems\n  ...EgdsTextItems\n  items {\n    __typename\n    text\n    styles\n    ...NotificationLinkNode\n  }\n  __typename\n}\n\nfragment NotificationForm on NotificationForm {\n  __typename\n  title\n  sections {\n    __typename\n    title\n    fields {\n      __typename\n      ...NotificationTextInputFieldForm\n      ...NotificationSubmitButtonForm\n      ...NotificationSelectionFieldForm\n    }\n  }\n  feedbackMessages {\n    __typename\n    name\n    title\n    text\n    displayType\n    level\n  }\n  successFormAnalytics {\n    ...NotificationActionFragment\n    __typename\n  }\n  errorFormAnalytics {\n    ...NotificationActionFragment\n    __typename\n  }\n}\n\nfragment TitleParts on NotificationPhrase {\n  accessibilityLabel\n  completeText\n  ...EgdsItems\n  __typename\n}\n\nfragment NotificationActionFragment on NotificationAction {\n  __typename\n  ... on NotificationAnalytics {\n    __typename\n    description\n    referrerId\n    schema {\n      __typename\n      name\n      messageContent {\n        __typename\n        name\n        value\n      }\n    }\n  }\n  ... on NotificationAnalyticsEgClickstream {\n    __typename\n    description\n    event {\n      __typename\n      eventName\n      eventType\n      eventCategory\n      eventVersion\n      actionLocation\n    }\n    schema {\n      name\n      messageContent {\n        name\n        value\n        __typename\n      }\n      __typename\n    }\n  }\n  ... on NotificationCookie {\n    __typename\n    name\n    value\n    expires\n  }\n}\n\nfragment NotificationItems on NotificationPhrase {\n  items {\n    __typename\n    text\n    styles\n    ...NotificationLinkNode\n    ...NotificationLinkNodeWithIcon\n  }\n  __typename\n}\n\nfragment EgdsItems on NotificationPhrase {\n  egdsItems {\n    ... on NotificationEGDSTextNode {\n      text\n      theme\n      weight\n      __typename\n    }\n    ... on NotificationEGDSLinkNode {\n      action {\n        accessibility\n        analytics {\n          linkName\n          referrerId\n          __typename\n        }\n        resource {\n          value\n          __typename\n        }\n        target\n        __typename\n      }\n      __typename\n    }\n    __typename\n  }\n  __typename\n}\n\nfragment EgdsTextItems on NotificationPhrase {\n  egdsTextItems {\n    ...EGDSStylizedText\n    ...EGDSStandardLink\n    __typename\n  }\n  __typename\n}\n\nfragment NotificationLinkNode on NotificationPhraseLinkNode {\n  id\n  type\n  uri {\n    __typename\n    value\n  }\n  target\n  actions {\n    ...NotificationActionFragment\n    __typename\n  }\n  __typename\n}\n\nfragment NotificationLinkNodeWithIcon on NotificationPhraseLinkNode {\n  id\n  type\n  uri {\n    __typename\n    value\n  }\n  icon {\n    id\n    description\n    title\n    __typename\n  }\n  actions {\n    ...NotificationActionFragment\n    __typename\n  }\n  __typename\n}\n\nfragment NotificationCard on NotificationCardTheme {\n  themeValue\n  cardBorder\n  __typename\n}\n\nfragment NotificationIcon on Icon {\n  id\n  description\n  title\n  withBackground\n  spotLight\n  __typename\n}\n\nfragment NotificationTextInputFieldForm on NotificationTextInputField {\n  label\n  id\n  placeholder\n  icon {\n    id\n    description\n    title\n    __typename\n  }\n  __typename\n}\n\nfragment NotificationSubmitButtonForm on NotificationSubmitButton {\n  label\n  id\n  actions {\n    ...NotificationActionFragment\n    __typename\n  }\n  icon {\n    id\n    description\n    title\n    __typename\n  }\n  buttonType\n  __typename\n}\n\nfragment NotificationSelectionFieldForm on NotificationSelectionField {\n  label\n  id\n  options {\n    __typename\n    id\n    text\n    shortLabel\n    value\n    selected\n    icon {\n      id\n      description\n      title\n      __typename\n    }\n  }\n  __typename\n}\n\nfragment EGDSStylizedText on EGDSStylizedText {\n  __typename\n  text\n  textSize: size\n  weight\n  theme\n}\n\nfragment EGDSStandardLink on EGDSStandardLink {\n  __typename\n  text\n  action {\n    resource {\n      value\n      __typename\n    }\n    target\n    analytics {\n      linkName\n      referrerId\n      __typename\n    }\n    __typename\n  }\n  iconPosition\n  size\n  disabled\n}\n\nquery NotificationsQuery($context: ContextInput!, $notificationLocation: NotificationLocationOnPage!, $lineOfBusiness: LineOfBusinessDomain!, $pageLocation: PageLocation!, $optionalPageId: String, $optionalContext: NotificationOptionalContextInput) {\n  notification(context: $context) {\n    inlineNotification(\n      notificationLocation: $notificationLocation\n      lineOfBusiness: $lineOfBusiness\n      pageLocation: $pageLocation\n      optionalPageId: $optionalPageId\n      optionalContext: $optionalContext\n    ) {\n      type\n      notificationLocation\n      title {\n        ...NotificationTitle\n        __typename\n      }\n      body {\n        ...NotificationBody\n        __typename\n      }\n      bannerContainer {\n        ...NotificationContainer\n        __typename\n      }\n      containerLink {\n        ...NotificationContainerLink\n        __typename\n      }\n      featuredImages {\n        ...NotificationImage\n        __typename\n      }\n      links {\n        ...NotificationLinks\n        __typename\n      }\n      dismiss {\n        ...NotificationDismiss\n        __typename\n      }\n      icon {\n        ...NotificationIcon\n        __typename\n      }\n      legalText {\n        ...NotificationLegalText\n        __typename\n      }\n      logo {\n        ...NotificationImage\n        __typename\n      }\n      revealActions {\n        ...NotificationActionFragment\n        __typename\n      }\n      backgroundImage {\n        ...NotificationImage\n        __typename\n      }\n      ...NotificationCustomQrCodeFragment\n      theme {\n        __typename\n        ...NotificationCard\n      }\n      attributes {\n        ...NotificationAttribute\n        __typename\n      }\n      switch {\n        ...NotificationSwitch\n        __typename\n      }\n      subBody {\n        ...NotificationSimpleSubBody\n        ...NotificationMultiSubBody\n        ...NotificationMessageCardSubBody\n        __typename\n      }\n      form {\n        ...NotificationForm\n        __typename\n      }\n      __typename\n    }\n    __typename\n  }\n}\n\nfragment NotificationCustomQrCodeFragment on InlineNotification {\n  customQrCode {\n    __typename\n    image {\n      description\n      url\n      __typename\n    }\n    title\n    encodedImage\n  }\n  __typename\n}\n"
  }
```

# Using the chrome extension
Once you have installed the extension, you'll notice a new tab when you open developer tools in chrome based browsers.

<div style="text-align: center" class="img-shadow">
  <img src="/images/debug-apq-2/devtools-tab.png" alt="Dev tools tab image" />
</div>

On accessing this tab, you'll be treated to a simple HTML form asking you, the user to add a regular expression which it will use for network interception.

<div style="text-align: center" class="img-shadow">
  <img src="/images/debug-apq-2/devtools-tab-window.png" alt="Dev tools window tab image" />
</div>

On this screen, you can use simple regular expressions, which on submission will start intercepting the requests based on the url path params of the requests.

<div style="text-align: center" class="img-shadow">
  <img src="/images/debug-apq-2/enabled-extension.png" alt="Screenshot when extension's debugger is enabled" />
</div>

When this extension is activated, you'll get two requests for the same action. One, with the cached hash :

<div style="text-align: center" class="img-shadow">
  <img src="/images/debug-apq-2/basic-apq-query.png" alt="Example of apq query using cached hash" />
</div>

And another will be the re-tried which will have the graphql query you need :

<div style="text-align: center" class="img-shadow">
  <img src="/images/debug-apq-2/apq-after-interception.png" alt="Example of apq query with the graphql query" />
</div>

Notice, that the highlighted section is the same request re-tried but with the actual graphql query in place as well.

# Installing the plugin
The plugin is available in the chrome web store as well as the microsoft edge webstore. The links of which are:

  * [Chrome Web Store](https://chromewebstore.google.com/detail/gbanmonipiommdljkadhhiomhkgjchee/)
  * [Edge Web Store](https://microsoftedge.microsoft.com/addons/detail/jifjbphbccecgcdagnjkefhjdcpljjic)

# Plugin in action
<div style="text-align: center" class="video-shadow">
  <video width="860" height="609" controls>
    <source src="/videos/debug-apq-2/GraphQL-Debugger-Tutorial.webm" type="video/webm">
    Your browser does not support the video tag.
  </video>
</div>

</div>