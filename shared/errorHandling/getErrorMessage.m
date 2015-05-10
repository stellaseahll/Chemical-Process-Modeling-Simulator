function combinedStr=getErrorMessage(errCodeVector)

combinedStr='ERROR!\n\n';
for i=1:length(errCodeVector)
    combinedStr=[combinedStr num2str(i) '. ' getOneErrorMessage(errCodeVector(i))];
end
end

function str=getOneErrorMessage(errCode)
switch errCode
    case 1
        str='Density of fluid has to be positive real number\n';
        return;
    case 2
        str='Density of particle has to be positive real number\n';
        return;
    case 3
        str='Particle size has to be positive real number\n';
        return;
    case 4
        str='Velocity of particle has to be positive real number\n';
        return;
    case 5
        str='Viscosity of fluid has to be positive real number\n';
        return;
    case 6
        str='Sphericity has to be between 0 and 1\n';
        return;
    case 7
        str='Particle density must be larger than fluid density\n';
        return;
    case 8
        str='Sedimentation concentration has to be between 0 and 1\n';
        return;
    case 9
        str='Initial Suspension concentration has to be between 0 and 1\n';
         return;
    case 10
        str='Initial Suspension concentration must be less than sedimentation concentration\n';
        return;
    case 11
        str='Exponent n has to be positive real number\n';
        return;
    case 12
        str='Vessel Diameter has to be positive real number\n';
        return;
    case 13
        str='Feed flow rate F has to be positive real number\n';
        return;
    case 14
        str='Underflow L has to be positive real number\n';
        return;
    case 15
        str='Overflow V has to be positive real number\n';
        return;
    case 16
        str='Cross-sectional area has to be positive real number\n';
        return;
    case 17
        str='Feed concentration has to be between 0 and 1\n';
        return;
    case 18
        str='Underflow rate (L) and overflow rate (V) must add up to feed flow rate (F)\n';
        return;
    case 19
        str='Pipe chosen cannot be connected to existing pipe. A bend is required.\n';
        return;
    case 20
        str='Horizontal pipe chosen cannot be connected to the bend\n';
        return;
    case 21
        str='Bend chosen cannot be connected to the bend\n';
        return;
    case 22
        str='Vertical pipe chosen cannot be connected to the bend\n';
        return;
    case 23
        str='Length of pipe has to be positive real number\n';
        return;
    case 24
        str='Pipe diameter has to be positive real number\n';
        return;
    case 25
        str='First pipe must be a horizontal or vertical pipe and not a bend\n';
        return;
    case 26
        str='Bend chosen cannot be connected to the vertical pipe\n';
        return;
    case 27
        str='Bend chosen cannot be connected to the horizontal pipe\n';
        return;
    case 28
        str='Mass flow rate has to be positive real number\n';
        return;
    case 29
        str='There should be at least one pipe added to calculate pressure drop\n';
        return;
    case 30
        str='Length of horizontal pipe must be greater than or equal to zero\n';
        return;
    case 31
        str='Length of vertical pipe must be greater than or equal to zero\n';
        return;
    case 32
        str='At least one of the horizontal/vertical pipe length must be non-zero\n';
        return;
    case 33
        str='Length of horizontal pipe is zero and hence it cannot be accelerated through horizontal pipe\n';
        return;
    case 34
        str='Length of vertical pipe is zero and hence it cannot be accelerated through vertical pipe\n';
        return;
    case 35
        str='Bed diameter has to be positive real number\n';
        return;
    case 36
        str='Mass of particles has to be positive real number\n';
        return;
    case 37
        str='Bed height has to be positive real number\n';
        return;
end
end