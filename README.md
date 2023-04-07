# Simple Budget

Simple Budget is a web-based version of the budgeting spreadsheet I have used for 15 years. It's loosely based on envelope-saving.

This particular application is the Ruby on Rails reference version of the Phoenix application. I find it quite useful to build a semi-complex application (more complex than TodoMVC) in any language and framework I am learning. In this case, I use it as a testbed to maintain Hotwire-related skills and experience.

## Running Simple Budget

Assuming you have a running PostgreSQL database...

    bundle
    ./bin/rails db:reset db:seed
    DEMO_MODE=true ./bin/rails server

## What is Simple Budget

In a picture...

![goals to saving](/docs/goals_to_savings_gu1aiCah6hu6.png)
