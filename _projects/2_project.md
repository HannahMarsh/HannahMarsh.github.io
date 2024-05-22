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

### Project Overview

This project addresses the critical vulnerability of distributed caching systems to node failures, which can severely impact performance in read-heavy applications. By developing a novel dual-layered hashing mechanism, our approach selectively replicates the most critical data, thereby enhancing fault tolerance without compromising system scalability or performance.

---

### Problem Statement

Distributed caching systems are essential for modern database-driven applications due to their ability to enhance performance and scalability. However, the reliance on unique hashing to individual nodes introduces significant vulnerabilities, as the failure of a single node can lead to system-wide cascading failures.

---

### Solution

Our selective replication strategy involves a dual-layered hashing mechanism where each key is assigned to both a primary and a secondary cache node. This setup ensures rapid failover if a node becomes unresponsive, maintaining system stability and continuous data availability.

<div class="row">
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.liquid loading="eager" path="assets/img/cache_database.drawio.png" title="Components" class="img-fluid rounded z-depth-0" %}
    </div>
</div>

---

### Methods and Evaluation

Our comprehensive evaluation demonstrated the efficacy of this approach in mitigating the adverse effects of node unavailability. By focusing on selectively replicating only the most frequently accessed data, we maintained minimal additional storage requirements and avoided significant impacts on overall system performance.

---

### Results and Impact

The project successfully mitigated the risk of cascading failures and performance bottlenecks, significantly enhancing the resilience and operational integrity of distributed caching systems. This approach offers a balanced compromise between resilience and efficiency, making it a viable strategy for systems requiring high scalability and performance.

---
