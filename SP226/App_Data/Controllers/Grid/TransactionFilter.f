<?xml version="1.0" encoding="utf-8"?>

<grid table="vrptdmmagd" code="ma_ct" filter="1 = 0" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""/>
  <subTitle v="" e=""/>

  <fields>
    <field name="ma_ct" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="tag" type="Boolean" width="60" aliasName="cast(0 as bit)" filterSource="Tag">
      <header v="Chọn" e="Select"></header>
    </field>
    <field name="ma_gd" readOnly="true" width="60">
      <header v="Mã giao dịch" e="Transaction Code"></header>
    </field>
    <field name="ten_gd%l" readOnly="true" width="200">
      <header v="Tên giao dịch" e="Transaction Name"></header>
    </field>
    <field name="ten_ct%l" readOnly="true" width="200">
      <header v="Tên chứng từ" e="Voucher Name"></header>
    </field>

    <field name="loai_ct" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ct_nxt" width="0" hidden="true">
      <header v="" e=""></header>
    </field>

  </fields>

  <views>
    <view id="Grid">
      <field name="tag"/>
      <field name="ma_ct"/>
      <field name="ma_gd"/>
      <field name="ten_gd%l"/>
      <field name="ten_ct%l"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf3AbuHx7TOrikQYEMJKsbbDkhqgeA3Qj6Ma8ZOnBavHrMpJuTP2KKwCx7WmjutNSixwrkaNoW9A4qhpMrpEPnDo7HEINPfY1zL8TMp7mHlx2</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfw0r+aDZxD7/z8Jv5YIeUV/oxL/oVhb8PwaCgFoALQugJmg9iK192+jntFCD9F4mGL88XWVHSeK0+hSEgon8J+HRo0RcevOk5BpsUVdQXP7X</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70AWYs1WMbXW4t6rMGyKy+hksaUL/0ldg3f1Y4Bwpaf7k74VTF+UtOPIKWeAHA0BathLOCq5jf3S/9iNV4RbrhfXuUjeLPOXPmC4DN8QJTmQS610CuVMqcrtIDzyjzCVt6hkbionQSYM7dJM8R1FiHfXTdRoMTKNqk8f6tIgEkveYFNQeLvyeNTOMRvk6mzORfvFejz8sDxhFRWZMzIsX9HPvgOPs4lmpr323ZVG1uRHP+1oR7b9IdvenWODUCoFeBSaYTGuzaNg7Sd+uVWmA+6EyGdrtOAOMjNFH7b/xLVUvTZpUaaGCtgYnICE/si35wAlqCJK/0ojNFoZcF6lwbOVvS9KXEIZZNzGm3BoBhrsTDTkj5oFX1vZgMMrMTZcpVTthLK0Bo/lVp/0X5HFtFEegFyjrYjJHZIiMXZ//rXfKzB0oSZW7SacaMZyjD4g5kc1fBOPfllvdmsuJ+kfpElZ/IfeMLt4yF6UE82mmemprbVmJvCHfpQAXY8E7V0zi20Ll2cHJYH4z+mh/gDyJKCnHZKGb1xCXWTVBk10sEYBrTPU78nN0BRWsNhEAe9vjaL5oV7ib4nGdcaLkJamqQZuLTbmjaFqthIBIocRq2P/vUv0s761ZTxkoNXGSgifyEq83tIKsC3llfHkf3qQMOAVUXSL+fLklxgQpJjM+pW3vEmE8AZH/4he2LaTVnOtwI2gc3Ug9fJumwiwNNh+I6AgFa/xHTZsSfJSImFxfzm33oIb0IuKpjijbo0MmKOzt4bh6VG1AhBhgLMLlyzx3s8uIxjGryrhKOGddFTfyGHneStOJ9zX6DYrWpyuIci7Yq1NHjXubyhRfO4DTybX6ow2I9qrXOMJkC42IGCFlXlPwLUQGu/uwSU4PuDK7Dkc7U13otgzrilv7jRlEdug5GEAIn/oloBFmsEnEvfPqZv9a4Sthg25QJkZtrz1bF7fkzI61r+IruJMs7gsRRfklLIvMGX+r7/OIhL1o/h+0sv735sGdUVrfNN+EzO4u+wvwZZ20rNKfezq2kadxUI9kQ17kTH9MuU0CoJaLPh5VT3mabgwXE0WYBr7mb0+RRlQk/T6J5u7BX0CtVIRMVv13DBTvAAzdNOMUvNNm13QVeBNjK0V2IhQzFe7y9v7MqYjxL5h/6io9R/FlyAsJeBYRg6GXLBOGyjZ02iRitDyyiOuc3wwHE4A3ip+aUnSlWsqxL2ENPezjJytvBryVN7MgtgXx9TzzBZyZt3WasTHDbLByOlO18OcW0lp5+iFAtvSnRnKyK3ouQTdRRbfJ99gLt+PlOmWHMvPjzOYocRZedTwiv1HVhmO7gcAH3St3g9DGDaLv6/1Ok5G0LoMBS8d8OcKuxqsvKkBIpxzJKND4Lj2uo9ObBET8HqQN0y6aBHQuaA==</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="Transaction">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf3oY9CX2VMbyfcWiLltS6xhbc2FZhNfdLCQjnbn8LbW3V4QYnYK0PpD7RA6vJo5SMOefB9RPzUJtSyHgewzQTFSAlVQj5v4h9kPbMe1l+n0U0Ib7DeNzdd3oMC/zlxCZvAmmjvIARJa7AKJud+oUu2v6noRdc80x0Z/wuyMiTzFh</encrypted>]]>
      </text>
    </action>
  </response>

  <toolbar>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>

</grid>