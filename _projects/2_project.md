---
layout: page
title: A Fault Tolerant Distributed Cache
description: A simulation modeling interactions between a database, cache nodes, and client requests
img: assets/img/selective_replication.png
importance: 2
category: school
---

<div class="row justify-content-sm-center">
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.liquid loading="eager" path="assets/img/components.drawio.png" title="Components" class="img-fluid rounded z-depth-0" %}
    </div>
    <div class="col-sm mt-3 mt-md-0">
        <span> </span>
    </div>
</div>

---

## Project Description

This project models a scenario where client requests are managed through multiple cache nodes placed ahead of a central database. Client-side hashing directs each request to a cache node; if data is not found, as depicted in the diagram above (a cache miss), the request then goes to the database.

## Introduction and Background

In read-heavy systems that are backed by a central database, it is common strategy to use a distributed caching system as a buffer to significantly reduce the load on the database. This allows for handling a workload much greater than the capacity of the underlying database, as the cache fulfills a large percentage of the requests.

## Problem

However, when the system operates at or close to its maximum capacity, even a temporary failure of one or more cache nodes could overwhelm the database, creating a bottleneck effect for the other nodes who are prevented from acquiring fresh data upon a cache-miss. As the overall hit rate diminishes, this leads to a cascade of failures throughout the system as more requests go unmet. Thus the stability of the entire system depends on the reliability of each individual node; should even one fail, it could trigger a feedback loop that jeopardizes the system's overall functionality.

## Proposed Solution

Our project aims to address this critical vulnerability. We propose a solution that introduces a dual-layered hashing mechanism to assign each key to both a primary and a secondary (backup) node. Each node keeps track of it's hottest keys along with which backup node each key is hashed to. Nodes are tasked with periodically synchronizing their hottest keys with their corresponding backup nodes. This selective replication focuses on maintaining the most critical data readily available in the backup node's cache, thus providing a rapid failover solution if the primary node becomes unresponsive. The client keeps track of the status of each node and when one is detected in a failed state, it redirects all requests that hash to the failed node to the backup node instead. This approach aims to maintain overall operational integrity and prevent the cascade of failures that compromise system stability.

<div class="row">
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.liquid loading="eager" path="assets/img/cache_database.drawio.png" title="Components" class="img-fluid rounded z-depth-0" %}
    </div>
</div>

---

## System Configuration

- 5 servers - one for the database and four for cache instances.
- The database runs in its own container using 2 cores.
- Each cache instance uses 3 cores, totaling 12 cores for all cache instances.
- Aims for 90% of requests to be served by the cache and 10% by the database.

## Project Structure

The project consists of multiple modules, each with its own functionality:

- **Cache Node**: Manages caching operations (uses Memcache)
- **Database**: Manages database operations.
- **Benchmark**: Responsible for distributing requests between cache and database layers and uses Alibaba traces for performance analysis.

---

### Methods and Evaluation

We hope that our evaluation demonstrates the efficacy of this approach in mitigating the adverse effects of node unavailability. We hypothesize that by focusing on selectively replicating only the most frequently accessed data, we can maintain minimal additional storage requirements and avoid significant impacts on overall system performance.
