getInner.itrfit.svm=function(obj, newdata=NULL) {
 a=obj$a
 n=length(a)
 level=obj$level
 k=length(level)
 var=colnames(obj$x)
 id=rownames(obj$x)
 W_aW=matrix(-1/(k-1), n, k)
 W_aW[cbind(1:n, a)]=1
 theta_gamma=as.matrix(obj$theta_gamma)
 K=obj$kernel
 if (!is.null(newdata)) {
  x=obj$x
  newx=as.matrix(newdata)
  if (any(colnames(newx)!=var)) stop('testing set must have the same structure as the training set!')
  id=rownames(newdata)
  kernel=attr(K, 'type')
  if (kernel=='linear') {
   K=newx%*%t(x)
  } else if (kernel=='gaussian') {
   epsilon=attr(K, 'epsilon')
   K=exp(-epsilon*as.matrix(pdist(newx, x))^2)
  } else if (kernel=='polynomial') {
   d=attr(K, 'degree')
   K=(1+newx%*%t(x))^d
  }
 }
 inner=get_inner(theta_gamma, K, W_aW)
 colnames(inner)=level
 rownames(inner)=id
 return(inner)
}