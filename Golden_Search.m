function [z, fz]= Golden_Search(f, a, b, c, tol, kmax)
    
    ya = f(a);  
    yb = f(b);  
    yc = f(c);
    
    if (ya < yc) || (yc > yb) 
        error('(a,c,b) does not bracket the min')
    end
    
    disp('   step         a         t1         t2         b         y1         y2   ');
    
    r = 0.5*(3-sqrt(5));
    
    if abs(c-a) < abs(b-c)             %initialize so that a < t1 < t2 < b
        t1 = c;  t2 = c+r*(b-c);       %(c, b) is longer subinterval
    else 
        t2 = c;  t1 = c-r*(c-a);       %(a, c) is longer subinterval
    end
    
    y1 = f(t1);  y2=f(t2);
    
    out = [0, a, t1, t2, b, y1, y2];
    disp(out);
    
    for k = 1:kmax
        if y1 < y2                          %(a, t1, t2) brackets the min
            b = t2;  t2 = t1;               %rename as (a, .., t2, b)
            t1 = t2-r*(t2-a);               %(a, t2) is longer subinterval
            y2 = y1;  y1= f(t1);
        else                                %(t1, t2, b) brackets the min
            a = t1;  t1 = t2;               %rename as (a, t1, .., b)
            t2 = t1+r*(b-t1);               %(t1, b) is longer subinterval
            y1 = y2;  y2 = f(t2);       
        end
    
        out = [k, a, t1, t2, b, y1, y2];
        disp(out);
    
        if abs(b-a) < tol 
            disp(' golden section search has converged'); break;
        end
    end
    
    if y2 < y1 
        z = t2;  fz = y2;
    else
        z = t1;  fz = y1;
    end
