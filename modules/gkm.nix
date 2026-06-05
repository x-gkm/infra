{ den, ... }:
{
  den.aspects.gkm = {
    includes = [
      den.batteries.define-user
      den.batteries.primary-user
    ];
  };
}
