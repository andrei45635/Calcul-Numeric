function rezultatFunc = pade_two(f, m, k)
    syms x;
    coeficienti = sym(zeros(1, m+k+1));
    for p = 0:m+k
        coeficienti(p+1) = subs(taylor(f, x, 'Order', p+1), x, 0);
    end
    
    matriceStangaVector = sym(zeros(1, 2*k-1));
    for i = -k+1:k-1
        if m+i < 0
            matriceStangaVector(i+k) = 0;
        else
            matriceStangaVector(i+k) = coeficienti(m+i+1);
        end
    end
    
    matriceStanga = toeplitz(matriceStangaVector(k:end), flip(matriceStangaVector(1:k)));
    matriceDreapta = -coeficienti(m+2:m+k+1).';
    
    %matriceB = linsolve(matriceStanga, matriceDreapta);
    %matriceB = pinv(matriceStanga) * matriceDreapta;
    epsilon = 1e-5; % Small regularization term
    regularizedMatriceStanga = matriceStanga + epsilon * eye(size(matriceStanga));
    matriceB = linsolve(regularizedMatriceStanga, matriceDreapta);


    b = sym(zeros(1, max(m, k)+1));
    b(1) = 1;
    for i = 1:k
        b(i+1) = matriceB(i);
    end
    
    a = sym(zeros(1, m+1));
    for j = 0:m
        for l = 0:min(j,k)
            a(j+1) = a(j+1) + coeficienti(j-l+1) * b(l+1);
        end
    end
    
    num = sym(0);
    den = sym(0);
    for l = 0:m
        num = num + a(l+1) * x^l;
    end
    for l = 0:k
        den = den + b(l+1) * x^l;
    end
    

    disp('Numerator:');
    disp(num);

    disp('Denominator:');
    disp(den);
    rezultatFunc = matlabFunction(num / den, 'Vars', {x});
end
