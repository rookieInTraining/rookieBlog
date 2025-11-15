---
title: "Fetch GraphQL query from an Apollo client using APQ - Part 1"
description: "Struggling to automate GraphQL APIs or fetch queries? Learn about APQ and how to intercept these requests in this guide to GraphQL automation."
date: 2024-07-20T23:55:00+05:30
draft: false
tags: ["graphql","apollo-graphql","apq","chrome-extensions","debugging","graphql-queries"]
categories: ["tools for automation"]
series: ["graphl-automation"]
featuredImage: "/images/debug-apq-1/apqd-banner-resized.png"
---

**APIs (Application Programming Interfaces)** for web applications have evolved significantly since the early days of the internet. Initially, APIs were simple and used primarily for data exchange between server and client, often through protocols like SOAP (Simple Object Access Protocol). These early APIs were cumbersome and required extensive documentation and strict adherence to protocols.

The rise of **REST (Representational State Transfer)** in the early 2000s marked a major shift, offering a more flexible and scalable approach to building web APIs. RESTful APIs leverage standard HTTP methods, making them easier to use and more intuitive. However, 2015 saw a paradigm shift, Facebook (now Meta Inc.) introduced **GraphQL** to the world, allowing clients to request specific data, resulting to it's rapid adoption amongst enterprises. According to reports, it is projected that by 2025, _over 50% of enterprises will use GraphQL in production, up from less than 10% in 2021_.

---

## Graphql 101 
For those who are new to GraphQL, I'll highlight some of the key concepts used below:

<div class="graphql-concepts">

<div class="concepts-grid">
<div class="concept">
    <h3 class="concept-title">Schema</h3>
    <p class="concept-description">The schema defines the structure of the API, specifying types, queries, mutations, and subscriptions. It serves as a contract between the client and server.</p>
</div>

<div class="concept">
    <h3 class="concept-title">Types</h3>
    <p class="concept-description">GraphQL uses various types such as <span class="concept-tag">Scalar</span>, <span class="concept-tag">Object</span>, <span class="concept-tag">Enum</span>, <span class="concept-tag">Union</span>, and <span class="concept-tag">Interface</span> to define the shape of the data and the relationships between different data fields.</p>
</div>

<div class="concept">
    <h3 class="concept-title">Queries</h3>
    <p class="concept-description">Queries are used to fetch data from the server. They specify what data is needed and can include nested fields to retrieve related data in a single request.</p>
</div>

<div class="concept">
    <h3 class="concept-title">Mutations</h3>
    <p class="concept-description">Mutations are used to modify data on the server. They allow clients to perform actions like creating, updating, or deleting data.</p>
</div>

<div class="concept">
    <h3 class="concept-title">Subscriptions</h3>
    <p class="concept-description">Subscriptions enable real-time updates by allowing clients to listen for specific events and receive updates when those events occur.</p>
</div>

<div class="concept">
    <h3 class="concept-title">Resolvers</h3>
    <p class="concept-description">Resolvers are functions that handle the logic for fetching the data specified in queries, mutations, and subscriptions. They map schema fields to data sources.</p>
</div>

<div class="concept">
    <h3 class="concept-title">Fields</h3>
    <p class="concept-description">Fields are the individual pieces of data that can be queried within a type. Each field can have arguments, making the queries flexible and dynamic.</p>
</div>

<div class="concept">
    <h3 class="concept-title">Arguments</h3>
    <p class="concept-description">Arguments allow clients to pass parameters to fields, enabling the customization of the data fetched by queries and mutations.</p>
</div>

<div class="concept">
    <h3 class="concept-title">Directives</h3>
    <p class="concept-description">Directives provide a way to modify the behavior of queries, such as including or skipping fields based on conditions (<span class="concept-tag">@include</span> and <span class="concept-tag">@skip</span>).</p>
</div>

<div class="concept">
    <h3 class="concept-title">Fragments</h3>
    <p class="concept-description">Fragments allow the reuse of parts of queries and mutations. They help in structuring queries and reducing redundancy by defining reusable units of selection sets.</p>
</div>

<div class="concept">
    <h3 class="concept-title">Introspection</h3>
    <p class="concept-description">Introspection is a feature that allows clients to query the schema itself to understand the types, fields, and operations available, aiding in API exploration and documentation.</p>
</div>
</div>
</div>

For further reading, you can go through the getting started present [here](https://graphql.org/learn/)

As discussed earlier, graphql's strengths is its ability to fetch exactly the data needed. This can however, also lead to issues if not managed correctly. Over-querying can occur if clients request too much data, impacting performance. Under-querying, where not enough data is requested, might require multiple requests to fulfill a need, which could negate some of the benefits of using GraphQL​.

Also, in order to avoid under and over-fetching, developers might resort to creating complex queries containing multiple fragments which increases the size of the payload that needs to be sent to the network which again impacts the performance of the application.

And this is where we are introduced to the **_Apollo Client_**.

---

## Apollo Client and APQ
As per their current documentation: 

<blockquote>
Apollo provides the developer platform and tools to unify your data and services into a supergraph—a single distributed GraphQL API.
Apollo makes GraphQL work for you at any stage and any scale, whether you're just getting started, building your first API, querying an API, or migrating your platform onto the supergraph.
</blockquote>

Apollo GraphQL Client provides several features that help overcome the limitations of GraphQL, enhancing the development experience and performance of GraphQL-based applications. The discussion for which is limited to **Automatic persisted queries or APQ**

<blockquote>
A persisted query is a query string that's cached on the server side, along with its unique identifier (always its SHA-256 hash). Clients can send this identifier instead of the corresponding query string, thus reducing request sizes dramatically (response sizes are unaffected).

To persist a query string, Apollo Server must first receive it from a requesting client. Consequently, each unique query string must be sent to Apollo Server at least once. After any client sends a query string to persist, every client that executes that query can then benefit from APQ.
</blockquote>

Now, this works wonders in boosting the performance of the application. But, does pose a threat to testing teams as they are unaware of the contracts set for the cached query. For example, a graphql query in [expedia.com](https://www.expedia.com) would be something like this:

```json
[
    {
        "operationName": "NotificationsQuery",
        "variables": {
            "k1":"v1",
            "k2":"v2"
        },
        "extensions": {
            "persistedQuery": {
                "version": 1,
                "sha256Hash": "<a really long hash which you would not want on blog sites!>"
            }
        }
    }
]
```

In a situation where the schema and documentations are not shared with the testing teams, one would require to either go through the codebase to view the queries being used or each out to the developer who is the owner of that particular feature/improvement. 

This can become a bottleneck for fast moving teams who are pushing features day in and day out to production _#IYKYK_. This then further prompted me to work on a utility which is the subject of this article.

The solution for which I'll post in the [part-2](/posts/debug-apq-extension-part2) of this article.

---

<style>
    .graphql-concepts {
        font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
        max-width: 1200px;
        margin: 0 auto;
        padding: 20px;
    }
    
    .concepts-title {
        font-size: 1.75rem;
        font-weight: 300;
        color: #111;
        margin: 0 0 0.5rem 0;
        letter-spacing: -0.5px;
    }
    
    .concepts-subtitle {
        font-size: 0.95rem;
        color: #666;
        margin: 0;
        font-weight: 400;
    }
    
    .concepts-grid {
        display: grid;
        grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
        gap: 1.5rem;
    }
    
    .concept {
        border: 1px solid #e5e5e5;
        border-radius: 4px;
        padding: 1.5rem;
        transition: all 0.2s ease;
        background: #fff;
    }
    
    .concept:hover {
        border-color: #000;
        transform: translateY(-2px);
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
    }
    
    .concept-title {
        font-size: 1.5rem;
        font-weight: 600;
        margin: 0 0 0.75rem 0;
        color: #000;
        letter-spacing: -0.2px;
    }
    
    .concept-description {
        font-size: 1.5rem;
        line-height: 1.6;
        color: #444;
        margin: 0;
    }
    
    .concept-tag {
        display: inline-block;
        background: #f5f5f5;
        padding: 2px 6px;
        border-radius: 3px;
        font-family: 'SF Mono', Monaco, 'Courier New', monospace;
        font-size: 0.85rem;
        color: #555;
    }
    
    /* Ultra minimal variant - uncomment to use */
    /*
    .concept {
        border: none;
        border-left: 2px solid #e5e5e5;
        border-radius: 0;
        padding: 1rem 0 1rem 1.5rem;
    }
    
    .concept:hover {
        border-left-color: #000;
        transform: none;
        box-shadow: none;
    }
    */
    
    /* Dark mode support */
    @media (prefers-color-scheme: dark) {
        .graphql-concepts {
            background: #1a1a1a;
        }
        
        .concepts-title {
            color: #f5f5f5;
        }
        
        .concepts-subtitle {
            color: #999;
        }
        
        .concept {
            background: #1a1a1a;
            border-color: #333;
        }
        
        .concept:hover {
            border-color: #666;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.3);
        }
        
        .concept-title {
            color: #f5f5f5;
        }
        
        .concept-description {
            color: #b3b3b3;
        }
        
        .concept-tag {
            background: #2a2a2a;
            color: #999;
        }
    }
    
    /* Mobile optimization */
    @media (max-width: 640px) {
        .graphql-concepts {
            padding: 15px;
        }
        
        .concepts-grid {
            grid-template-columns: 1fr;
            gap: 1rem;
        }
        
        .concept {
            padding: 1.25rem;
        }
    }
</style>