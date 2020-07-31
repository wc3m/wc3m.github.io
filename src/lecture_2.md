# Lecture II: Time and States

## Rates and Time

Consider walking to say, a nearby park, or the supermarket.

> If we are to predict how far we can move by walking, then we need to know our starting point, and how many steps we need to take, along with the length of each step, this is all a computer needs as well.

Formally, we have:

- A starting point
- An end point
- A step size

Now with our understanding of representations, we can understand that this means we can do things at each step, say, plant a flower. In this case, the function represents planting a flower, the location is determined by our steps, and time is as we experience it.

For completeness, we mention in passing that this is what is known as a first order approximation to the derivative. Like our computer however, this has no inherent meaning for us. We will instead appeal to a more intuitive understanding.

## Trajectories

From [lecture 1](./lec1sv.md), we are familiar with understanding the description of molecules to a computer, however the concept of time requires an addition of two things:

- A time variable
- (_for our studies_) a formula of how the system changes at each time

Note that the second point is related to us trying to make the computer description consistent with our own observations.

> If we want to check if ice has melted we expect that the "melting" process takes place in our absence, this is something which we need to tell the computer about though!

With that understanding, we will further note that:

- **Zero** time is when we start making observations

A consequence of this is that if we are unable to describe the system to a computer before the time we start making these observations (describing our data to the computer).

We will return to this concept later, after we formalize our understanding of phase spaces!

## Time-steps

For our description above, we did not mention the units of time we are interested in. This is because the unit depends on the nature of the process we are interested in.
