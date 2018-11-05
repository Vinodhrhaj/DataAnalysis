
# coding: utf-8

# In[ ]:


#Simple linear Regression
#y = mx +c
def predict(radio, weight, bias):
    return weight*radio + bias


# In[ ]:


#Cost function
#1/N(Sum(1 to n)(y- ))
def cost_function(radio, sales, weight, bias):
    companies = len(radio)
    total_error = 0.0
    for i in range(companies):
        total_error+= (sales[i] - (weight*radio[i] +bias))**2
    return total_error/companies


# In[ ]:


#Gradient Descent
def update_weights(radio, sales, weight, bias, learning_rate):
    weight_deriv = 0
    bias_deriv = 0
    companies = len(radio)

    for i in range(companies):
        # Calculate partial derivatives
        # -2x(y - (mx + b))
        weight_deriv += -2*radio[i] * (sales[i] - (weight*radio[i] + bias))

        # -2(y - (mx + b))
        bias_deriv += -2*(sales[i] - (weight*radio[i] + bias))

    # We subtract because the derivatives point in direction of steepest ascent
    weight -= (weight_deriv / companies) * learning_rate
    bias -= (bias_deriv / companies) * learning_rate

    return weight, bias


# In[ ]:


#Training
def train(radio, sales, weight, bias, learning_rate, iters):
    cost_history = []

    for i in range(iters):
        weight,bias = update_weights(radio, sales, weight, bias, learning_rate)

        #Calculate cost for auditing purposes
        cost = cost_function(features, targets, weights)
        cost_history.append(cost)

        # Log Progress
        if i % 10 == 0:
            print "iter: "+str(i) + " cost: "+str(cost)

    return weight, bias, cost_history


# In[ ]:


def normalize(features):
    **
    features     -   (200, 3)
    features.T   -   (3, 200)

    We transpose the input matrix, swapping
    cols and rows to make vector math easier
    **

    for feature in features.T:
        fmean = np.mean(feature)
        frange = np.amax(feature) - np.amin(feature)

        #Vector Subtraction
        feature -= fmean

        #Vector Division
        feature /= frange

    return features

