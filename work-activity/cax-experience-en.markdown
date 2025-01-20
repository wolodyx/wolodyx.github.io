---
layout: default
title: CAD/CAE/CAM experience
---

[Русская версия]({% link work-activity/cax-experience-ru.markdown %})

# CAD/CAE/CAM experience

I have been working in the field of CAx (CAD/CAM/CAE) since 2010.
My job was related to scientific research and the development of promising methods for creating three-dimensional computational grids for numerical modeling of various physical processes.
The results of my work can be seen [here]({% post_url 2022-03-27-publications %}).
The following areas of work that I have been involved in are:
* multiblock grid generation (2010-2018);
* boundary layer extraction (2018-2022).


## Multiblock grid generation

A traditional structured grid consists of hexagonal cells that are convenient for calculations and are compactly stored in memory.
However, it only covers simple areas for calculations.
Multiblock grid expands the advantages of structured grid to more complex areas.
The computational domain is divided into connected hexagonal blocks, and a structured grid is created for each block.
Structured grids are combined into a single unstructured grid.
The main challenge lies in creating these blocks, which requires special knowledge and intense manual labor from the user.
Due to this, the idea of multiblock grids seemed unpromising, but the work was not in vain.

I have implemented efficient data structures to represent a multiblock grid in RAM.
They were generalized to surface unstructured grids and published in the [article](https://elibrary.ru/item.asp?id=44522569).

An attempt to generalize multiblock grids to hybrid ones led me to realize that the result had a lot in common with modern geometric modeling kernels (C3D, Parasolid, ACIS, OpenCASCADE) and computational geometry problems.
However, unlike constructing 3D models and describing a boundary, my case related to describing an internal volume.
This prompted me to investigate CAE geometry (or virtual topology) as a research topic.

Multiblock grid building requires intensive user interaction and manipulation of three-dimensional objects.
To speed up this process, I have proposed the following improvements:
* [fast rebuild of the multiblock grid](https://elibrary.ru/item.asp?id=32712325);
* [reducing the number of blocks](https://elibrary.ru/item.asp?id=44010236).

The project consisted of 150,000 source lines of code and approximately 500 files.
It also included 2,000 unit tests, that took around 30 minutes to complete.
These tests helped control regression, but they also required maintenance.
To address this challenge, I have come up with the idea of using *dynamic instantiation for parametric tests*.
These tests can be executed with different input values that are supplied separately, making them ideal for geometric modeling where many complex functions operate on standardized data sets.
Instantiation involves linking a parametric test with specific input values.
Typically, this occurs statically, with the necessary data being written in the test project.
However, my approach allows for dynamic configuration through configuration files, making the test more flexible and portable.
This enables the entire suite of tests to be run on confidential customer data.


## Boundary layer extraction

The next research and practical project that I was involved in was the boundary layer extraction through the offset of a triangular grid.
The extracted layer was then used to create computational grids for CFD problems.
One unique aspect of this project was that it had already been implemented and utilized in production settings.
My role was to analyze the source code, optimize the program's performance, and improve the results.

At first glance, triangular grid offseting seemed like a straightforward task.
However, we encountered difficulties in achieving the same quality results for hundreds of different models.
Changes to the program that improved the results for some data significantly worsened them for others.
This phenomenon is known as program regression and was difficult to detect due to the large number of test cases in the database, the test duration, and the manual analysis of results.
To address this issue, I proposed a regression testing methodology based on A/B testing.
This approach involves a set of metrics, tools for analyzing these metrics, and a step-by-step analysis process.
This allowed us to reduce the regression testing time from a week to an hour.

The second challenge in the boundary layer extraction was related to the geometric model issues.
These models consisted of surfaces that were difficult to use for computational grids generation.
When we approximated smooth surfaces with a triangular grid, we encountered degenerate and nonuniform triangles.
I reviewed the problematic data and explored ways to address these issues during the process of preparing the computational grid.
