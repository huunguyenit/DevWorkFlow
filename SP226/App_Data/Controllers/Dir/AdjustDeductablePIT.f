<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY CommandWhenBalanceBeforeEdit SYSTEM "..\Include\Command\WhenBalanceBeforeEdit.txt">
  <!ENTITY CommandWhenBalanceBeforeDelete SYSTEM "..\Include\Command\WhenBalanceBeforeDelete.txt">
]>

<dir table="tdcthuekt2" code="nam, ma_dvcs, loai_tn, ma_ns" order="nam, ma_dvcs, loai_tn, ma_ns" xmlns="urn:schemas-fast-com:data-dir">
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
    <field name="ma_ns" isPrimaryKey="true" allowNulls="false">
      <header v="Mã nhân viên" e="Employee"></header>
      <items style="AutoComplete" controller="TaxEmployee" reference="ten_ns%l" key="status = '1' and ma_dvcs = @@unit" check="1=1" information="ma_ns$phns.ten_ns%l"/>
    </field>
    <field name="ten_ns%l" readOnly="true" external="true" defaultValue="''">
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
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 40, 60, 330, 0"/>
      <item value="11011: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l], [nam]"/>
      <item value="1101: [loai_tn].Label, [loai_tn], [ten_loai%l]"/>
      <item value="1101: [ma_ns].Label, [ma_ns], [ten_ns%l]"/>
      <item value="110-: [tnct_dc].Label, [tnct_dc]"/>
      <item value="110-: [tnct_dc_nt].Label, [tnct_dc_nt]"/>
      <item value="110-: [thue_dc].Label, [thue_dc]"/>
      <item value="110-: [thue_dc_nt].Label, [thue_dc_nt]"/>
      <item value="1100: [ghi_chu].Label, [ghi_chu]"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf5tBLgdGVVlRmk0Qyi7erwRm75QLhs08S3IdqOl8Q+GGveTVuLE1f5AhXYhwPEizGtXvQwCAF10qKNBJddKxmVybh35zIwC+kRIh0UwGUgHk</encrypted>]]>
      </text>
    </command>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a6aEs9CDKG1l5LVMA32xHbVOJJWOxCFEC8ei6fYR73b/Kq3/7pU2e4tjiNFl5aaNvARguf9KvlzChAZhsCc/52yxda/Ibo05mGoDGqHlUy1PeTNvbfYv4mausFc0nVKh54cTVMWSCvR8fWi+sz+NGZGGPJZ8pzAshdJznVjwBlfWVpZyMZsnAj0o4kPONrt2hZAALFjixBjytW1N7HL5hhVXKLWa8qih6dRPm732uq8GWiLE1eirvovNWFvISzw2T4gc/o/cEMrkTWFK285sqlb+SHbnwEFEfliWi1s4US4OmPZc+kOUiNhFKXugyaRZyclFL3dfBJx6husL7yM2XYbN78xsIi7ZI80apN6Nq7FiKfCDTeJI1JQkZmXPaVjQbzNgX6ooolFP0ocXwLxoP4E6grREO6ArADKVneJC7k8W+LfxaWRMzB2kx5FZDjazMNAA/9DkKZ6A5SlrVeD/FU6y9l7HpsAsbemnoMoo+w+</encrypted>]]>&CommandWhenBalanceBeforeEdit;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf1bZ6B5atbZg/+vHOz7SdC3Ed64LNS1uJdKN/B3Rm0Rx/V2VAEkXQItYwA7FtUm4OTYM9NZqOxjOQOnPyIWL5aKGBHXmxMuhjsSe6GPTpQxLsi/HM41fRQwbtLGqZZKQ0aDsPM3pqM8/gDVkknq6oyDrcenADDzipT/UNMdyoMtRBiFeI2Gd9i7tWyDNX28/wIsNQGzsDEjeTwkmUIzwaC5hG72mBigUG/7wo/OyVyhNB+R7ozxJ581y0Gmg+h2nWQ==</encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a6aEs9CDKG1l5LVMA32xHbVOJJWOxCFEC8ei6fYR73bE0p7wL2MgpyHCfXM2xoSu1C0Dum1y3I+xwMOx/n+ydD0oRA++EU7/LUBmAn3q5AlNMU8hP3PQ+DnytOCnthYQu0P4O7YpTj+qb3q27vcUlRzvXPeYabgk3zzYLCTMwOmY/dB+NECpjknqoDLpCSp3QYq3+jOktVf79chhRroIhmULGDrILEnUnXe/7UEbue6uUJV00TgMfwFk0OkaAN1oO6gSHzh1YzxFkAHk/F1DyKFeAeRrU95s2ggQAtvRMyxhIsji97DHNawx5RLNOlUpg==</encrypted>]]>&CommandWhenBalanceBeforeEdit;<![CDATA[<encrypted>%IYfbRnGMZu+vvTXZ4br7Kqn9eLPYpqqw6vwM4wFvjp5ChAXBOCfj2hruwXh1j+fOabuztLyoYLrPuX4zXIp8axjDUT9CvWkyPs3EdCEk+LrBoMFYKuYzLHB6ypHtKESWSKvB7nIlkcGxAo/DTvJ0b8XF7IHIAHn1XQfltSfCWd6OSyToRoS4CWU2r1Lvcmp9AKlTHXsA3xlx7fYdlx1CbSAl10yQDnWTxqnWmfUQcDRzSvetOhjyBT+IHpqexmd/UideEK6zP23VMj02ytfA9A==</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbQ9ngVoPD52TWPV19fuDXI0WP4nybxsnOqeUZNI/5SYuG1SFvQ8Pc+9iGLUFI8Psk4IXyANzzTUEq4Uytyu4ipaavEQfdmb2pNcm0PFVdq6r2YrpPc52xrQHcS9NaR/S/wOomYksvq0WkgjwTkGQRy58Z92otr8Uutkw9NhbUjsjXQ60FXu7eso6Sk7VDevZPLhkzse1iGwYtuH2j+e4gwM2h9kpF2Hp8VSI5+9BLzboovWc4PJXtE6kcBE9me3vc9oqoy8UKTHKf26Kk82EpQ/G/hSs0TmTRkH94k7InDM0Iqd9hquPSzXkNZA45oQv9uaFT/z+fFayMmnpngwnSiIV4nn8GbSt9uRm3Es7zVfK7s180c5VdyTIE0k3K/bVtqYcL2iXhs+VY8QgxogRooYkHxvOFNGDYK6jTiWSqwCcQbid+ndGjTWc6cKy59dSC/nHtEylbR3s+jeMEOdOJouVU+4ooTOwAMMYy3JyiVNhRqOjhbLThNt1yIxQ/TtmwQthcpfjykOMwa+nSpSDE0OqdoRmpLAsLqQrfC0JOtrpdtXIKvmvv1czi5uS031zQEXRFs3zvPrqnIdppyiAn+ovL83Lg6/6DA7JNPvGzDgvCg99yus9e+08znm9rHTKv106EgORRkIA1JUw5JJ6/bFU0SLMGiiUz5by3zd8AU7Asw6J2SnPcdFl4UKnXZeDzfuRcTCnpPM02h95896vOuHWbWN37XjY6bhpN2PrMb/FXJafLsSFVOCbbEGAfgQkvgM8t5TmgIrfLnybwQy2OyN099KM0C7IoO9wVV3tRomkg==</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK7H6Eq0mASX/gVg8nq9UW4ieUEQxGWV/caHSFGak/Co3cytQVCozgWskKgxgci9hzvpjKT14b17rgoq8lGmAZcw1Lc9gnm0Ipl8/qxn53rRlgm1+g2Ktd+Wz7EA1UCrDj6cIbL6UJpBPpQr3guY/rqP3k8Y+hsxmdM/bz+X4wghUDA/PBP1PFl/QpekBaGJFZ2jeUJu/trlUkYijTttgmSzx1J0pgXfcrtQL7c7W8EuFLoEFhlAz0v8oh/u6WDcq/GAQAGxG2F8iG5+m0CwU5D7KdhiBN/lmeSZnGLfiOVZnu7pCdMGwBWi8zPQnUVVT2A/Ncy5JVjtlSGqOsUZC0CG3/tMyVByHsRjNg1gfW8ZYS28efW9tplbfOlcUKXfR/4=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK7H6Eq0mASX/gVg8nq9UW4ieUEQxGWV/caHSFGak/Co3cytQVCozgWskKgxgci9hzvpjKT14b17rgoq8lGmAZcw1Lc9gnm0Ipl8/qxn53rRlgm1+g2Ktd+Wz7EA1UCrDj4wRwkwoU9lyRCCQDZIStGhHjB+HAjt9UjL5ZR2tbt/M/SxVD8EdKIxQgCY34cLDuhLS8tNLQrCeJbk+L1JnTVHDPjTNVnyxkkWglLM5ngJJbBQhCBKfpkw82rDX1X0Qvtzgf44hQ+yWVULs9ky4ofw2GmzUcRW+hB/wBgfGO934gDIyT0ShSX9zee+YNcoFg2JfE5XsDr+hwu5l3O0TuyKYTagsxr38zV4+H8tLbKk6ZM55ygMs6VTX95Ya67fnYRQYOjeBxU76GVFcPbuiFCX75slRLNir70rbH2BczLj+EzU+QApHvlu9knM0ObgEYiQpf/fDsRTIcO92V5iiAey</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbeoJ+DOf3ngC8YWY8utprm/EOhbBU8nxf4w7Mgd+7NM5Yidb21rUtp0SWMyEK2nURR0cbT85+qW1WQ3Sya03KD88=</encrypted>]]>
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
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Msg+Cvi92hbbdWcvfs7LcY9G3ntMPcLiHOVyrn1i0dLH+PXlHECvfv9xkmqiWwx34jKzpWaWi5pu+t5Y71htinQfUfUxytUgO1UniLQQi4YuPtIJPuMEmgSeTZwxGB/9UdXuozVGWSf5pNQkO51vUsbAKogpx+mLWyT5ox4w0KeGoEs1oHpZDgWws2P1xD3bt6posfAyFjwUVuKQoQUpHyxMoe+1MDYGc8SaMj/9HMaNTommuY2O56JGnHqJ/GQxHkNXmuVTCWVLnUOr/JikJE=</encrypted>]]>
    </text>
  </script>

</dir>