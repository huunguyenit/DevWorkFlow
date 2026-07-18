<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY Session "">
  <!ENTITY Identity "MPSAtpDetail">
  <!ENTITY MaxColumn "24">
]>

<grid table="mpsstruct" code="ma_so" type="Detail" xmlns="urn:schemas-fast-com:data-grid">

  <fields>
    <field name="ma_so" width="0" hidden ="true">
      <header v="" e=""></header>
    </field>
    <field name="chi_tieu" width="300">
      <header v="Chỉ tiêu" e="Norm"></header>
    </field>
    <field name="ky0" type="Decimal" dataFormatString="@quantityViewFormat" readOnly="true" clientDefault="0" width="80">
      <header v="Quá hạn" e="Past Due"></header>
      <items style="Numeric"/>
    </field>
    <field name="ky1" type="Decimal" dataFormatString="@quantityViewFormat" readOnly="true" clientDefault="0" width="80">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="ky2" type="Decimal" dataFormatString="@quantityViewFormat" readOnly="true" clientDefault="0" width="80">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="ky3" type="Decimal" dataFormatString="@quantityViewFormat" readOnly="true" clientDefault="0" width="80">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="ky4" type="Decimal" dataFormatString="@quantityViewFormat" readOnly="true" clientDefault="0" width="80">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="ky5" type="Decimal" dataFormatString="@quantityViewFormat" readOnly="true" clientDefault="0" width="80">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="ky6" type="Decimal" dataFormatString="@quantityViewFormat" readOnly="true" clientDefault="0" width="80">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>

    <field name="ky7" type="Decimal" dataFormatString="@quantityViewFormat" readOnly="true" clientDefault="0" width="80">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="ky8" type="Decimal" dataFormatString="@quantityViewFormat" readOnly="true" clientDefault="0" width="80">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="ky9" type="Decimal" dataFormatString="@quantityViewFormat" readOnly="true" clientDefault="0" width="80">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="ky10" type="Decimal" dataFormatString="@quantityViewFormat" readOnly="true" clientDefault="0" width="80">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="ky11" type="Decimal" dataFormatString="@quantityViewFormat" readOnly="true" clientDefault="0" width="80">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="ky12" type="Decimal" dataFormatString="@quantityViewFormat" readOnly="true" clientDefault="0" width="80">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>

    <field name="ky13" type="Decimal" dataFormatString="@quantityViewFormat" readOnly="true" clientDefault="0" width="80">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="ky14" type="Decimal" dataFormatString="@quantityViewFormat" readOnly="true" clientDefault="0" width="80">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="ky15" type="Decimal" dataFormatString="@quantityViewFormat" readOnly="true" clientDefault="0" width="80">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="ky16" type="Decimal" dataFormatString="@quantityViewFormat" readOnly="true" clientDefault="0" width="80">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="ky17" type="Decimal" dataFormatString="@quantityViewFormat" readOnly="true" clientDefault="0" width="80">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="ky18" type="Decimal" dataFormatString="@quantityViewFormat" readOnly="true" clientDefault="0" width="80">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>

    <field name="ky19" type="Decimal" dataFormatString="@quantityViewFormat" readOnly="true" clientDefault="0" width="80">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="ky20" type="Decimal" dataFormatString="@quantityViewFormat" readOnly="true" clientDefault="0" width="80">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="ky21" type="Decimal" dataFormatString="@quantityViewFormat" readOnly="true" clientDefault="0" width="80">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="ky22" type="Decimal" dataFormatString="@quantityViewFormat" readOnly="true" clientDefault="0" width="80">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="ky23" type="Decimal" dataFormatString="@quantityViewFormat" readOnly="true" clientDefault="0" width="80">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="ky24" type="Decimal" dataFormatString="@quantityViewFormat" readOnly="true" clientDefault="0" width="80">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_so"/>
      <field name="chi_tieu"/>
      <field name="ky0"/>
      <field name="ky1"/>
      <field name="ky2"/>
      <field name="ky3"/>
      <field name="ky4"/>
      <field name="ky5"/>
      <field name="ky6"/>

      <field name="ky7"/>
      <field name="ky8"/>
      <field name="ky9"/>
      <field name="ky10"/>
      <field name="ky11"/>
      <field name="ky12"/>

      <field name="ky13"/>
      <field name="ky14"/>
      <field name="ky15"/>
      <field name="ky16"/>
      <field name="ky17"/>
      <field name="ky18"/>

      <field name="ky19"/>
      <field name="ky20"/>
      <field name="ky21"/>
      <field name="ky22"/>
      <field name="ky23"/>
      <field name="ky24"/>
    </view>
  </views>

  <commands>
    <command event ="Showing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu6eKWlrqbEHgOEtl+nt21pH3fe9DMxOnQVpMitp8+FHzQl9ze8vRqeUEwdzipb6hKGp90Fqqcf0ugJEl6ekk+HnX3NOygtxDOi0BSGi9s85EjHvdI38BkhARlus3rZMUnpx7kSFD7fzyuvMXDchz5kBQMsxOcbUUW3XZnQ48tlTxdtjDwlZJQWlT5t4UcDsrRYxaal0hunBzuM24hRwjp/Wl0Xqoh+IRloc0ZsmvKNANr3OgJ6aLg9q72Z9irp40UdiHA4k3VRzDoe/Ny1GvcDaWXtN6r/QuA2TEtQZHRlCoxfuTrBmRYDPF7MG+nZQMNdYbIcL3j5QLNZnXM6LrrMcojTbFi0Bdxw8OeYYv26F2c0BjxjH/TJPkStiBWTBj7/udmazZvXKzGqnJfcwtRe1BlNIBpc48bafB71fCV4/D</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l1yH59f6MhPOXyMBbwgoBw1FFCwCwJMOEptR6J6/o413E5+dtA4ttywPcxSuk7GwQLw==</Encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcIkDam2OpJKeUPrZ6I5WGFhnaMdP3TwDZh3ymfnifRK0</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l16dCzkPCkdKPBNy4yMInqhFccvlF+UYh75UKXSvDykln3Ickvc7nixhs5a/aB/aYnA==</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL751wZiTGtWeHzFQZhMwU6K2dxZTKcK8IzZ4gALgNH9xBQ</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l16dCzkPCkdKPBNy4yMInqhFccvlF+UYh75UKXSvDykln3Ickvc7nixhs5a/aB/aYnA==</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22ciTfxXLWkc6njlqPxulQ8Q0LC8B5NMqT/jHhfrgr+Va</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l1wTIuS3c4MMVcs8FKGb8qqUMv5PJBnR/W2uKzefzfZbCVfw/kxxb7ORGSruLLQGwXg==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHa328rQWUhD33uKrso0w6Xn1w6WJV1a6vf8fZCKSWobrYJ3lfLyxtQu0j9gs95elWA==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&udt43HER0ZKtYSlUlqdyEXiWUQ0H4vSWLEfZL3wtMAA9cvAXz3YyJErBlwgYgm+KJqn2j7wKdflbqAKLp8sGeg==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l1/Q0Y+c0aMeoPR87DyalPICmOczjn3IYen8eps/nqqtn8Pecki1VhfETECaIHJMlaA==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&udt43HER0ZKtYSlUlqdyERnOvM4NG/oV2IoQpuvFNmPT8aFeXkqML0n58IyfPpyVJPSeqAr9CDMdp2coTBVvqh4L1aO2je+AKubJC3/H/thR40vZG42GBBbuon639x99</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHf0K/PkZMeMcIFiiqOrbgv8XdMi2B1isS1B7VfG461a6GnLEyDgr7sGJjQSKIYs0FQ==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&udt43HER0ZKtYSlUlqdyETI2WiGOq6VNUevZE9pq357DcNxnQ9HSc0BB2LwNdOowd5xhuCTqWPlyeJGmutd9kxF2kUcTHSh8q7Dt4Zlj2rGlbKOrQ1Bh7UnPRrG9zuxhrHmbhV/EoOtrs8dv+vgCXVqM6hx/bJrSMDB7vUx5ViwgaXrQOrWk6UMy8Ec21vvf5Ef1/KqmdNIk/rAk2miUDFm5ADAnDsgrYBsXx8bnva+GOJeN/zgCqsCy5Kn9D508JFWtsaABXSe5IeBNW4j0TPrK/Bbpu5p7SqxZV201HhoJ7/qKED48SY1ph8Y5XGyas4ViW1t3YAWF/Fu4Mk3281mED581FVloTKFlVay2gnkmWIFMiyjF5bg0IixAzWBclNYDfUHzNM9dY95LLHZ0AteM17U67EGXYMcXiY0sh34a/aTzU9ZMYnG6NxsgurezA8zDi6tjewEK8mCFOmu87TEU+7Z4V9nkp2Im7Tz2yCeJx5ru2wWbG7hZCqfwEa9GUaWHEubL7qeMcCPl2q0rwU2unSvM00unI6xwrgPwzNW3JqRemkGEwnIxY5bRlOZ7H31fGL1mejebatSDQkexLPNhjvSo6k5y7Z8Izugoe7xS5cJNbKT7/yQIAlYVPKhjtWRgNNY/dTOPcOZg7klW9p7P9mjrshJEC3/egk251leM2NnCcCUEu8RWF4UjrzbIFNkUtLfFtcdps/2ynEKL05yB3SjC60w7+GWnq0fZ0RrqqN++LBW+u+nRJdKt5Mjm0UnzuorjfX473PbhrF+eOouWyk9aIZtEqfsFlksW/2GGQHZiqQfyszQrK08kCI8s</Encrypted>]]>&Session;<![CDATA[<Encrypted>&3/ynUYepZpRiAlwlRh2K/dSJ5TpH8AOfzvCryi/SnOjJRRiCXGQHDQWqIbzEUnAHDW6077Bbbns6rzB2+ML9E3EqFntAQPzIUOQfFYB7JEc=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l18eSxgMsbQOc9J28ZT4i4jMPbx+Dv5TNoLmn90yvfmA8WYG5jynXvSa2UtUZQmLbdBVB2/3bzZX0PCtf+4iQvvo=</Encrypted>]]>&MaxColumn;<![CDATA[<Encrypted>&XpAcZ7HRWjEUU2F2AGbQf4ThR2hvTjp6k2NBcStlOJSYbyxjATHWstse8n8a7ReC8aB42FB0LleE/oJP1w6xo6Su4wZZy8Sru5H9XbcznZD/dKpCl9BS7goE6j/LM+UlHBIK/nZ6Olhq4gkF7BAkHQ==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&ExC4VyevidizrIeD1rekt5zUs5lHw2xVXH70sXwGfHAcZLfB6bNNsSBfpVHjnj3xlVjC3z4GNx0doo6TePFdR4lms0wUN2z7Zwmf9M1VHw0=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&ExC4VyevidizrIeD1rekt2UDGWQ65wkH5Fi/H4G2qy9YmzHnw6xAMXxjyyTE3LLHydeW7YPZjfMdz6cDFlb9GPl4UIPEpEuqvMf9lMtEppxoTY5tmbkDrUVmXGzkQ6ebgXTPaf1M0+x+UbAJ+xZaji4tEiPfFq9I9Gjssw9yWa//FUuJEmLwek2PoSNgXk+Ijl5wTf5GcpPPuIWd6psw60IGKn46ZAfbyPLBo6Ff+8/8musSrdDSGDnmGuO/DT/Y4skFcPCAZYMrkw3ZmeoAekaWftbIZictRX/KAvKGZRZ8dcnVp7IXj38/UA9WoEno/FtZz9tHKvojT+k3ojtnDy/CovqMilI+zgISFsrINTPafz6UvOIC1F1s3qVAmhaP</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&ExC4VyevidizrIeD1rekt0hVmG6DD0gpCryIokQitYqOQ3krYEewZ1Rpx9aFodCPWLcIgPwOfLfeqp//vYGB3uaSTwMg2k0fyQzubneznbHz/Jtc8sUGSfoTGzr0PZMeMOu+Zg8jhOLO+b+N7gSZxbLSHGIdsLkmiilRfnJHcGJ7hQmo/tBzqimulGvvaI6JNziYsoaLHWBC8a5P/QrlnXETrHYV7C0ujCyHKS+amGc=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHceHln07NptlA9XqndRRXAgoRl1LkXmk6Fm8pgBOYTm85FtgXyDMKnLPyrv1T9itxixwxiDsVECSpc3fFrWks3AQ6aDR0WUgpj1xMLCi43q4vXxAboQm7QTCw+4FahsRuBph8comcdN6pxgH2hnWk6ah97PR2sjYWor3yKJO2OQXhcVt2/kzwdGJ9mXLHrdiAnje3SG4g45VKSVMGID3I7M=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&pOaJOB7c2Z2L/MPuZ3ZQj7PowwNjGxgTxUt8BmkrzCj17TFfzxPVBMQ96ZRXklqom8UF16kYBs75NX67sP9UwA==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&pOaJOB7c2Z2L/MPuZ3ZQj+4RsT8F6kqKJoRPG4nvQU/2rGjU8tAhR8RNKp/DocCv91kEt4s9+BO7jy9a5XMiVsnUK8PIv/52zeayxGUxFaZlJ1wbl5ZxbLpvswlJXJh06D7/evnXPeB/JePZjFW60LCL3LW9kUP2ubvcc8eN2Oi13+82NdBuH5O20SCbwoa0VSs1nvqsyLe36O8Fs05qCg==</Encrypted>]]>
    </text>
  </script>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL75+lTgX9OAZWpKSxkDzm9aParPkSndaaSerBMZXQ5cZb8Vxw07lIlrYUJFFVdjYfL/Q==</Encrypted>]]>
      </text>
    </query>

    <query event="Finding">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu31A6O6WXH99uiOUlAhYFhkxwhVwqN6tkPluGdNdmq/026RlYeI6ZrmSKi7WZajAuMvm3uqP7h8R4H9vLNV7vaPkU2yM9ajE5k1BdzvKwobJ6qh14QJx0JPZblBmUEWTvXtdHfPP5zSwhlMiSzVInaC0AC3m+mg+Y7zyv9w8MtwSOaBV7bi3HMF29o2bp0mW8YCwB1y2lcux/veTMX/eE8w=</Encrypted>]]>
      </text>
    </query>
  </queries>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu71maxaNiwrJ1YQVz/dFFyqkmjXcHdj2CWohqhNjva7CvNoiN6P7/DKdjBi1ttVWZbwK33NRquQKJUPPTj8NfXjN/FAZvEmHfXRMJdedsIiknhqgpezV+E01uEmg/3q3TYrHFXfn61qa+m9pIxNyw/WeBUqDK4CP9iKx6nL+YUo4GqSIgnCq2yopMjSe5/5UqWufpgWolFI2TK/dp+mLKniLGZv+gnPJ5E37Q0GHSeBwnnA5S/C6Gq2wL1sczHUxwQ==</Encrypted>]]>
    </text>
  </css>

  <toolbar>
    <button command="AddAtp">
      <title v="Thêm đơn hàng dự kiến$$90" e="Add simulated booked order$Add...$120"></title>
    </button>
    <button command="EditAtp">
      <title v="Cập nhật đơn hàng dự kiến$$90" e="Simulated booked order input$Edit...$120"></title>
    </button>
    <button command="Separate">
      <title v="-" e="-"/>
    </button>
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>