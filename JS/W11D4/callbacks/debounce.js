Function.prototype.myThrottle = function(interval) {
  let tooSoon = false;
  return (...args) => {
    if (!tooSoon) {
      tooSoon = true;
      setTimeout(() => tooSoon = false, interval);
      this(...args);
    }
  }
}


Function.prototype.myDebounce = function(interval) {
    let action;
    return (...args) => {
        const func = () => {
            action = null;
            this(...args);
        }
     clearTimeout(action);
     action = setTimeout(func, interval);
        
    }
   
}