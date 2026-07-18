<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY CommandWhenBalanceBeforeEdit SYSTEM "..\Include\Command\WhenBalanceBeforeEdit.txt">
  <!ENTITY CommandWhenBalanceBeforeDelete SYSTEM "..\Include\Command\WhenBalanceBeforeDelete.txt">
]>

<dir table="hrtdcthuekt" code="nam, ma_dvcs, loai_tn, stt_rec" order="nam, ma_dvcs, loai_tn, stt_rec" xmlns="urn:schemas-fast-com:data-dir">
  <title v="thuế khấu trừ" e="Deductible PIT"></title>
  <fields>
    <field name="nam" type="Decimal" isPrimaryKey="true" dataFormatString="###0" allowNulls="false" hidden="true" readOnly="true">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_dvcs" isPrimaryKey="true" disabled="true">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" key="status='1'" check="1=1" information="ma_dvcs$dmdvcs.ten_dvcs%l" />
    </field>
    <field name="ten_dvcs%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="loai_tn" isPrimaryKey="true" allowNulls="false">
      <header v="Loại thu nhập" e="Income Type"></header>
      <items style="AutoComplete" controller="IncomeType" reference="ten_loai%l" key="status = '1'" check="1=1" information="ma_loai$tdmloaitn.ten_loai%l"/>
    </field>
    <field name="ten_loai%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_nv" external="true" defaultValue="''" allowNulls="false">
      <header v="Mã nhân viên" e="Employee ID"></header>
      <items style="AutoComplete" controller="hrEmployee" reference="ho_ten" key="(ma_dvcs = '{$%c[ma_dvcs]}') and (@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="(ma_dvcs = '{$%c[ma_dvcs]}') and (@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID))" information="ma_nv$vhrnv.ten"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZY7NdgtVYLJXG21LYhNXVpPYjM20vbbdScvKrGOaRK2yCtbbeSKzDbsyNwxV3cQwZLY8WkjwJstrq2MvFqJtW78=</encrypted>]]></clientScript>
    </field>
    <field name="ho_ten" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="tnct_dc" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" align="right">
      <header v="Thu nhập chịu thuế" e="Assessable Income"></header>
      <items style="Numeric"/>
    </field>
    <field name="tnct_dc_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" align="right">
      <header v="Thu nhập chịu thuế nt" e="FC Assessable Income"></header>
      <items style="Numeric"/>
    </field>

    <field name="thue_dc" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" align="right">
      <header v="Thuế" e="Tax"></header>
      <items style="Numeric"/>
    </field>
    <field name="thue_dc_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" align="right">
      <header v="Thuế nt" e="FC Tax"></header>
      <items style="Numeric"/>
    </field>
    <field name="ghi_chu" rows="2">
      <header v="Ghi chú" e="Note"></header>
    </field>

    <field name="stt_rec" isPrimaryKey="true" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 40, 60, 330, 0"/>
      <item value="11011: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l], [nam]"/>
      <item value="1101: [loai_tn].Label, [loai_tn], [ten_loai%l]"/>
      <item value="11011: [ma_nv].Label, [ma_nv], [ho_ten], [stt_rec]"/>
      <item value="110: [tnct_dc].Label, [tnct_dc]"/>
      <item value="110: [tnct_dc_nt].Label, [tnct_dc_nt]"/>
      <item value="110: [thue_dc].Label, [thue_dc]"/>
      <item value="110: [thue_dc_nt].Label, [thue_dc_nt]"/>
      <item value="1100: [ghi_chu].Label, [ghi_chu]"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6UoUpYuqMx9RhLOo9gUy0WlReh14MN6RiLTfBnXRWv84UwVXBlVrmfsn/KXWJhJNctQUZNg2kkMlz6mvLPym8gLpQja3lbN2xTFa3tEmSIs</encrypted>]]>
      </text>
    </command>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a6aEs9CDKG1l5LVMA32xHbVOJJWOxCFEC8ei6fYR73b/Kq3/7pU2e4tjiNFl5aaNvARguf9KvlzChAZhsCc/52yxda/Ibo05mGoDGqHlUy1PeTNvbfYv4mausFc0nVKh54cTVMWSCvR8fWi+sz+NGZGGPJZ8pzAshdJznVjwBlfWVpZyMZsnAj0o4kPONrt2hZAALFjixBjytW1N7HL5hhVXKLWa8qih6dRPm732uq8GWiLE1eirvovNWFvISzw2T4gc/o/cEMrkTWFK285sqlb+SHbnwEFEfliWi1s4US4OmPZc+kOUiNhFKXugyaRZyclFL3dfBJx6husL7yM2XYbN78xsIi7ZI80apN6Nq7FiKfCDTeJI1JQkZmXPaVjQbzNgX6ooolFP0ocXwLxoP4KSk7VSD6zlKo28se2V7ci+3//SFdpA5auWFzqJy9y8wN6qZWkx/KqYS+Hvj1N7QHmgbPhFrIOF/2dlMyDSnkJ</encrypted>]]>&CommandWhenBalanceBeforeEdit;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf1bZ6B5atbZg/+vHOz7SdC3Ed64LNS1uJdKN/B3Rm0Rx/V2VAEkXQItYwA7FtUm4OTYM9NZqOxjOQOnPyIWL5aKGBHXmxMuhjsSe6GPTpQxLsi/HM41fRQwbtLGqZZKQ0aDsPM3pqM8/gDVkknq6oyDrcenADDzipT/UNMdyoMtRBiFeI2Gd9i7tWyDNX28/wIN67njGoO6YkKLKdqYJdeaWeM/ND/tw9h/klcsJfA2SP324fukrsNo32y9Nu3VCcA==</encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a6aEs9CDKG1l5LVMA32xHbVOJJWOxCFEC8ei6fYR73bE0p7wL2MgpyHCfXM2xoSu1C0Dum1y3I+xwMOx/n+ydD0oRA++EU7/LUBmAn3q5AlNMU8hP3PQ+DnytOCnthYQu0P4O7YpTj+qb3q27vcUlRzvXPeYabgk3zzYLCTMwOmY/dB+NECpjknqoDLpCSp3QYq3+jOktVf79chhRroIhmULGDrILEnUnXe/7UEbue6uUJV00TgMfwFk0OkaAN1oHrRnng4kOK9lOwNHkex+/gkr7pRHATGXx0r+6QwdgfKzO186ofQFIXbRHvh2Xc4ag==</encrypted>]]>&CommandWhenBalanceBeforeEdit;<![CDATA[<encrypted>%IYfbRnGMZu+vvTXZ4br7Kqn9eLPYpqqw6vwM4wFvjp5ChAXBOCfj2hruwXh1j+fOabuztLyoYLrPuX4zXIp8axjDUT9CvWkyPs3EdCEk+LrBoMFYKuYzLHB6ypHtKESWSKvB7nIlkcGxAo/DTvJ0b8XF7IHIAHn1XQfltSfCWd6OSyToRoS4CWU2r1Lvcmp9AKlTHXsA3xlx7fYdlx1CbSAl10yQDnWTxqnWmfUQcDRzSvetOhjyBT+IHpqexmd/UideEK6zP23VMj02ytfA9A==</encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf5WAgvvzBzlOj7wKqtW9qSF/LbHeTRVXEn+6wzNA/Mc20kgxk6CcZFzTvukSjxOP9uIMe+d6+SsmW2papwudMtUsylFoRFftSj0IfECHL+zG</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf2iGXg34puTlcaaYn9fIkhRT3y7KBXlx/WoGfz8IHsWPsapPTm1kHaCogH+5Ml7Up7E7To1GtCtchDSS6Du0zTb4tZFydY35OwOAy4c22q/J</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbQ9ngVoPD52TWPV19fuDXI0WP4nybxsnOqeUZNI/5SYuG1SFvQ8Pc+9iGLUFI8Psk4IXyANzzTUEq4Uytyu4ipaavEQfdmb2pNcm0PFVdq6r2YrpPc52xrQHcS9NaR/S/wOomYksvq0WkgjwTkGQRy58Z92otr8Uutkw9NhbUjsjXQ60FXu7eso6Sk7VDevZPLhkzse1iGwYtuH2j+e4gwM2h9kpF2Hp8VSI5+9BLzboovWc4PJXtE6kcBE9me3vc9oqoy8UKTHKf26Kk82EpQ/G/hSs0TmTRkH94k7InDM0Iqd9hquPSzXkNZA45oQv9uaFT/z+fFayMmnpngwnSiIV4nn8GbSt9uRm3Es7zVfK7s180c5VdyTIE0k3K/bVtqYcL2iXhs+VY8QgxogRooYkHxvOFNGDYK6jTiWSqwCcQbid+ndGjTWc6cKy59dSC/nHtEylbR3s+jeMEOdOJouVU+4ooTOwAMMYy3JyiVNhRqOjhbLThNt1yIxQ/TtmwQthcpfjykOMwa+nSpSDE0OqdoRmpLAsLqQrfC0JOtrpdtXIKvmvv1czi5uS031zQEXRFs3zvPrqnIdppyiAn+ovL83Lg6/6DA7JNPvGzDgvCg99yus9e+08znm9rHTKv106EgORRkIA1JUw5JJ6/bFU0SLMGiiUz5by3zd8AU7Asw6J2SnPcdFl4UKnXZeDzfuRcTCnpPM02h95896vOuHWbWN37XjY6bhpN2PrMb/FXJafLsSFVOCbbEGAfgQkvgM8t5TmgIrfLnybwQy2OyN099KM0C7IoO9wVV3tRomkg==</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK7H6Eq0mASX/gVg8nq9UW4ieUEQxGWV/caHSFGak/Co3cytQVCozgWskKgxgci9hzvpjKT14b17rgoq8lGmAZcw1Lc9gnm0Ipl8/qxn53rRlgm1+g2Ktd+Wz7EA1UCrDj6cIbL6UJpBPpQr3guY/rqP3k8Y+hsxmdM/bz+X4wghUDA/PBP1PFl/QpekBaGJFZ3dTLEPDOQPE6eARfwQMe4SoPQ9D3RfnhJBuFd0t7Za4BqSxPlbbpdHZm6qreop3TN6TvJHubO5uzQlJB5Cuyf1ES0VPyYpK0+DjWqOpn9KqXnPb8tMfnOcGKHQoLzACyGc/uxjy++0MXs7oyjm5WEa7J5MO4W1VyaSRcRpGYbAy5JkOoOQC7WFVNmqlwDVYtQ=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK7H6Eq0mASX/gVg8nq9UW4ieUEQxGWV/caHSFGak/Co3cytQVCozgWskKgxgci9hzvpjKT14b17rgoq8lGmAZcw1Lc9gnm0Ipl8/qxn53rRlgm1+g2Ktd+Wz7EA1UCrDj4wRwkwoU9lyRCCQDZIStGhHjB+HAjt9UjL5ZR2tbt/M/SxVD8EdKIxQgCY34cLDuhLS8tNLQrCeJbk+L1JnTVHBunWh9/QQ1zkQTSpMxky9PLuSTcMLpx4rQayxG+9trr931lpYfiiBDVgqGcJ26g7UHE7Q0r9Z85GXfIvHOLVRmUb/XZg8Ghuy2AfBLEjEjqIUkAihbcWLEzNt51jq417I8wUa+zMsQ187irbli/vokeqhJx7sMCwOlUgpxv3x69V+lNHs1VVwF+vcsfQrBZ4dj1E8f9Qds5DyCHMsz8Zzice3HZOqoA7Y1DgMWvHyqaCZ/lY7wqM0RE/UZ73lj+K</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbeoJ+DOf3ngC8YWY8utprm/G8+5pwAMZI7fjuP2JQBsdA/Q4qvwk3ICU4KZTVfivKTy03vayZC++3tM9RpP/NCvU=</encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        &CommandWhenBalanceBeforeDelete;
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK7H6Eq0mASX/gVg8nq9UW4ieUEQxGWV/caHSFGak/Co3cytQVCozgWskKgxgci9hzvpjKT14b17rgoq8lGmAZcwwRYg7bz6l235a91z0ZiS/ZpDFY+TwaJtHLiL8J/VrYjxEckzYwO12JOVKJgXfJIy</encrypted>]]>
      </text>
    </command>
  </commands>
  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70NPRpqLZddPFcPKv50UNnlbgTO5yLj/Ni2pgiCqtF1X9m+YL94bpO3yb7Iv1z9lSx1/d+HJtyrCtYRbrg//NUFHsBLIy+Zmv9oeTaBC76Loqkp+vJYbcG6ke/E+OfCL1fVZR0NNAaxihqDj4CtTXioied1T3zIky+POv5yd/uNYHjeT4dN+GwmNX+R1UEnHyxbvbqteJBReJ6PLHuW/HScEPY/nxpZEVNtL1eOGNt6W+TlQ5/zJi3sEq0YXIsesnqg6j6zLJ6P/2VwAwsTLjA5tRD6241oZ3qsF/3IwJwdziOoI4FCe4hI+JHhgNRORtSN7QSlLIaW124UPTRF8+M0c/oL/g7wSAmw9/DR75Nu4duYuI6lMiWliL/usXCqZnCBVqSBuINJCfpeU+RB11zEXkP58DH8CQluB6WVuoxNqw5CSA9k90jiS7xVh7S2S6Rhu75J/B+pIZAbH+tvLDj5i7Ap3eAOFYykUY9dZSEqxFE/oyNgOtEhqz4HtjYCe5o1zLTY33hn6FUzL/wg8XJ8HN5VnxFUzQln1eO4FWlaDCg6RnWfhB3b8KpAI2+yy5cK/6BJWuAohMAUUo+iYjSxGqEOqstXHqHH8rOgAv7xj/</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="IDNumber">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK6Wdyk9aPi/fGimY6rlT0N834CG83zUb9SXy8KMWrDvIiBAKWf40KbJwL838aYZkZtmrP9W1pbacgosiXEASu+jwvUZefQ/Ya0zzEmPQ2z5iw==</encrypted>]]>
      </text>
    </action>
  </response>
</dir>