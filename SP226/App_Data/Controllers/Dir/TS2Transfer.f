<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ToolSupplyTable "dcbpsddc">
  <!ENTITY ToolSupplyField "stt_rec">
  <!ENTITY ValueDate "@ngay_ct">
  <!ENTITY FieldDate "ngay_ct">
  <!ENTITY FieldFocus "ngay_ct">
  <!ENTITY ExternalKey "">

  <!ENTITY CommandGetIdentityNumber SYSTEM "..\Include\Command\GetIdentityNumber.txt">
  <!ENTITY CommandWhenToolSupplyExternalBeforeEdit SYSTEM "..\Include\Command\WhenToolSupplyExternalBeforeEdit.txt">
  <!ENTITY CommandWhenToolSupplyExternalBeforeDelete SYSTEM "..\Include\Command\WhenToolSupplyExternalBeforeDelete.txt">

  <!ENTITY CommandToolSupplyLockedBeforeEdit SYSTEM "..\Include\Command\ToolSupplyLockedBeforeEdit.txt">
  <!ENTITY CommandToolSupplyLockedBeforeDelete SYSTEM "..\Include\Command\ToolSupplyLockedBeforeDelete.txt">
  <!ENTITY CommandCheckLockedDate SYSTEM "..\Include\Command\ToolSupplyLockedDate.txt">

  <!ENTITY CheckData "
exec rs_CheckTSDereaseQty @ngay_ct, @ma_dc, @ma_bp_tu, @so_luong, @stt_rec, @$xvalue output
if @$xvalue = 1 begin
  select 'so_luong' as field, @$invalidQuantity as message
  return
end
">
  <!ENTITY Post "exec rs_PostTSTransfer @stt_rec">
]>

<dir table="dcbpsddc" id="CC3" type="Voucher" code="stt_rec" order="ma_dc, ngay_ct, so_ct, stt_rec" xmlns="urn:schemas-fast-com:data-dir">
  <title v="điều chuyển bộ phận sử dụng" e="Tool &amp; Supply Transfer"></title>
  <partition table="dcbpsddc" prime="dcbpsddc" inquiry="dcbpsddc" field="ngay_ct" expression="''" increase="{0}" default=""/>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_dc" allowNulls="false">
      <header v="Công cụ dụng cụ" e="Tool &amp; Supply"></header>
      <items style="AutoComplete" controller="TS2Tran" reference="ten_dc%l" key="(ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID and r_new = 1) or @@admin = 1)" information="ma_dc$dmccdc.ten_dc%l"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZRFaIWNmPVZq/DEVydeZoHzPzNiiX08vs1daHNwnJm6JkLsl45Ek91QZ3DVsI0wivQ==</encrypted>]]></clientScript>
    </field>
    <field name="ten_dc%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ngay_ct" type="DateTime" allowNulls="false" dataFormatString="@datetimeFormat">
      <header v="Ngày chứng từ" e="Voucher Date"></header>
    </field>
    <field name="so_ct" dataFormatString="@upperCaseFormat" allowNulls="false" align="right">
      <header v="Số chứng từ" e="Voucher Number"></header>
      <items style="Mask"/>
    </field>
    <field name="ma_bp_tu" allowNulls="false">
      <header v="Bộ phận sử dụng từ" e="Source Department"></header>
      <items style="AutoComplete" controller="TSDepartment" reference="ten_bp_tu%l" key="(exists(select 1 from dmdcct a where a.ma_bp_dc = dmbpcc.ma_bp and a.ma_dc = '{$%c[ma_dc]}') or exists(select 1 from ctpsdc b where b.ma_bp_dc = dmbpcc.ma_bp and b.ma_dc = '{$%c[ma_dc]}')) and status = '1'" check="exists(select 1 from dmdcct a where a.ma_bp_dc = dmbpcc.ma_bp and a.ma_dc = '{$%c[ma_dc]}') or exists(select 1 from ctpsdc b where b.ma_bp_dc = dmbpcc.ma_bp and b.ma_dc = '{$%c[ma_dc]}')" information="ma_bp$dmbpcc.ten_bp%l"/>
    </field>
    <field name="ten_bp_tu%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_bp_den" allowNulls="false">
      <header v="Bộ phận sử dụng đến" e="Target Department"></header>
      <items style="AutoComplete" controller="TSDepartment" reference="ten_bp_den%l" key="status = '1'" check="1 = 1" information="ma_bp$dmbpcc.ten_bp%l"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZZO2j0aixFxWgGZFcU3i82Vq0/NpNwVTBDqHD2iwhWqtW+VhAD7pP/9PjVx10h1aWw==</encrypted>]]></clientScript>
    </field>
    <field name="ten_bp_den%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="so_luong" type="Decimal" dataFormatString="@quantityInputFormat" allowNulls="false">
      <header v="Số lượng" e="Quantity"></header>
      <items style="Numeric"/>
    </field>
    <field name="tk_pb" allowNulls="false">
      <header v="Tài khoản chờ phân bổ" e="Allocated Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_pb%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk_pb%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="tk_cp" allowNulls="false">
      <header v="Tài khoản chi phí" e="Expense Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_cp%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk_cp%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="dien_giai">
      <header v="Diễn giải" e="Description"></header>
    </field>
    <field name="ma_dvcs" allowNulls="false" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="dv_yn" type="Boolean" external="true" defaultValue="cast(0 as bit)" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 330, 0"/>
      <item value="110: [ngay_ct].Label, [ngay_ct]"/>
      <item value="110: [so_ct].Label, [so_ct]"/>
      <item value="11011: [ma_dc].Label, [ma_dc], [ten_dc%l], [ma_dvcs]"/>
      <item value="1101: [ma_bp_tu].Label, [ma_bp_tu], [ten_bp_tu%l]"/>
      <item value="1101: [ma_bp_den].Label, [ma_bp_den], [ten_bp_den%l]"/>
      <item value="110: [so_luong].Label, [so_luong]"/>
      <item value="1101: [tk_pb].Label, [tk_pb], [ten_tk_pb%l]"/>
      <item value="11011: [tk_cp].Label, [tk_cp], [ten_tk_cp%l], [stt_rec]"/>
      <item value="11001: [dien_giai].Label, [dien_giai], [dv_yn]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &CommandToolSupplyLockedBeforeEdit;
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a6aEs9CDKG1l5LVMA32xHb3fo5H/YFkrmgBgukOI3tOtypaqAr5e7hxUOGZIqxc/sQkszHx27e2jg3yeQ0juoZBSx3DCLaDvaujMPu/sA33OoR6B34tXom6mXuL6Dvh2g==</encrypted>]]>&CommandWhenToolSupplyExternalBeforeEdit;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf3NRpUadENUhghGHTcGQ5B6ZBwzJ1Lv66umdAlaQgen0DUIH1YIiGLQUmw4HKnzV5Q==</encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        &CommandToolSupplyLockedBeforeEdit;
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a6aEs9CDKG1l5LVMA32xHb3fo5H/YFkrmgBgukOI3tOtypaqAr5e7hxUOGZIqxc/lOolXihhdnaMUFjDp8FFPyNe6djwsVABos/yLh1+gEj</encrypted>]]>&CommandWhenToolSupplyExternalBeforeEdit;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf3NRpUadENUhghGHTcGQ5B6ZBwzJ1Lv66umdAlaQgen0DUIH1YIiGLQUmw4HKnzV5Q==</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfwRik3h6jV8TcRPcZnTTvqTGykU6PpAHueemhM+zrwNbpbDH0XeshFPKS/xHZQ8qdCUXzP+h1MpaI8GcZSh/IgI=</encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfwiJFTp716WGUT+dOSl6JLxbcvroOZ3eWZ6aYQgWVBNOBGjLJNkYhqihYE22ouaJFcviRrvByXPXibznNrGS7/t71JLCPp7ijSTX/T8TJI62UKywbutH+sKdpt3hmWwOJw==</encrypted>]]>&ToolSupplyTable;<![CDATA[<encrypted>%J3hZcNH+5AoPDSecUXSscK/FxNqu+FSg1z2aFHBvauqkg6t0n/r2GjTBw7teyWiil1rMMBRxrsRzRleARcltjA==</encrypted>]]>&ToolSupplyField;<![CDATA[<encrypted>%AyKM0JsLz2siGub+f8OUFm7AB7gPnWXWd8LCdQY6A+Y=</encrypted>]]>&ToolSupplyField;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf5RhxtFmY+xJYnZQ1t8vVgqDaNKqfayZvHQ0CPKY7KFi</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WaN8MSyJECa5wYt3cvTqaI0CAjGNdxpzX46nqQzksP+iY8krroioCUT9A7eC8fEruH5sxxaRXyxA6PqEu7cB0ee5L9800B5cSKp1aKzgvWbkeaHzpkq+flRIAIztHNXwP5+1b1I4mTC28wmKp6HYuuGHa1Dbk4hAXdMgipLZRVrbhsDpecbacMftF2xFEiKFH5h4q6IJGxDr8lAbzdToV8SGLG4yuHBBLEiLfBUpV3snLa4B3BLO2/lBcFrIjzDn6Wb6nUaDwHKyBMiyNJnt7uqYNaflBBvtzBpeUVZjslkgZh/9waqaqMeRQC8NqdFHwLabbuzCB5Zf0++5bDfmf6MRHlXGCbjgxLZ/aE0SpohyQTv8YWxKq8p8shqMjw55HwY6leUFXR9C7zGLZuFwcfj01alFzhVyjAhtfMhkrrwlSP0rQsqbKgqAsqnHBV0ZjrJyg8vbJpMm3HIvHY+Elpk3AZZjNXXQm6Wo/lh/agduPn13hnK98SK6t8WlqqZ0jNEZSWaIWm9EqfzjPe/duFw==</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfysEz0KvRMQqepvz7Xl99jZxdMjZqmSu3m2Y1f8HxlRAdUcsaY0176ksLlycXPMUrG503TUJqr8yaEwX1K4kEmaTaBjhLQPTer9BxvEBFBFF9dXGe/sf1r7GO+2W9zslGgv5K/xHj43jArdlMwmpw7Sa+9dahLcQptqk+vzIR0bhPy3qRH/aeP1+ZD1rR9Ouaul3sDuTDfqXboFupMRlaAT2AUwQ2YrNK8huNSnCkNtARpnGkLfZlT5V+PexniClLKvtZabcCk1CPSHRSYAFKq17m4wRL5+D1EtsGvXM0QcsT+D9xUBDqFyFvaTDAq1cFAyXKaKM9XIKlUerPeRh1cc=</encrypted>]]>
        &CommandCheckLockedDate;
        &CheckData;
        &CommandGetIdentityNumber;
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6Rw9UNBNVvcZBsvKdm765j3sHFnnlTYaC7bVWnZRpO82magN++rJdVB9NPJg2KPVliuYeYyjDPU4qxZmEPagTN8Oh9KD9vSRg/uV9/BCOL5noXmLL3kZwbYoGfs0+LqQTQm675V7ISag73XolNfFpA30KM6c4mXpCB8pQ/9vXUONPQPSQhxi8ZSQZHX7aVR0O5HMQ+0AfTndWcd/suAq6GNPnHC5U9RPmpJ3Q96Vql18azaTNWhbe7Az9mAhpXFRE+bIythaMIuCNngG6Ijj78WqD+h9m++2cc0k60rtTGku</encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        &Post;
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf/j7JvfGk/5wDyNsftuikB+fMlntUCCCS3Cw7o2nvwtkv9hOHJXaaBzcS4IWu1gP3Q==</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        &CommandCheckLockedDate;
        &CheckData;
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6Uv+9eq2GO1rxaaIzR1Shyh4Fw5JXn9yRoHn8OJ9tWj3Sqa6V70WLXJ+czSbKW+R0r7li3TCWqOo/5ehyhdItggGur1rnkqSWZbC5tlZDowqnBOzJxz+XGMjATI4OXii0gBxxEUJgNsRlvzZBG+JoRdvDF2LMK2yWh5iHBlCmlpui151H+y7OEuubK+9DSI7+rWeOdzsOQhZccGbRzz3b2yisQ8lOfbsSYQmvYzKcI2WI+T8HNureUMtvpfXxKjPj2aLKNEU0giF+fSCcehnIlHLNrMnzr010hK8/46cMSMrhv4DIxNWNew2qK1ALfFWozbiHAcI9E83jZYivuP74EzMmae2tQIzp+HMx4eh2UwJaQbC147KxCeWb1KytlzHzy5S6T6TYlXSsZTsVkstnGYseIV70BX/URJmnyqgquz6nvmceih8UMkSsoZUzcKwzw==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6Rw9UNBNVvcZBsvKdm765j3sHFnnlTYaC7bVWnZRpO82magN++rJdVB9NPJg2KPVliuYeYyjDPU4qxZmEPagTN8Oh9KD9vSRg/uV9/BCOL5nOZlvHLSRxqHOIxPLY+nXUNiyEr18jVL8yFF4UPt3LJpk3ELoyawV/UXxjcFTY1nrPthynw9fTolK9fwvHZa86sWgfr9mNcvvICfBqDqIxVVBmQVuZrrMgyU2Mkn/TUafgg7Rca++Jw+EXVqW2HJw+g==</encrypted>]]>
        &Post;
      </text>
    </command>

    <command event="Deleting">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VjC9fcT0//RLaXg2kg5GRF2PhHxRbrQwP+b65XmSEh5tPqFkr9Xlqs8ERBtuVzXuifeo7qFxwKgHLNKP//JtY1A4VWF9GzICrLNDjfTu9Rk</encrypted>]]>
        &CommandToolSupplyLockedBeforeDelete;
        &CommandWhenToolSupplyExternalBeforeDelete;
      </text>
    </command>

    <command event="Deleted">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6ew7TabwqpwvdH//Ea0TZFtaP1umlEaGsltntMfyXB9V6MwKWGoN9SyFbiGjZmR0yQ==</encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70KInAnqcXJOY1YJQqLL4krgJd/7CQp/35Yys2fX6lfqxaFS6Gum/CTCFzMQsyjv7xiRYbZNrTX5F7UCX/OQ2bW6/okRQifuNbVqs/R/e51d6beSL8JplPNHsKKiW5pcFrY+YMUvtnt+zLuhfKV5hWuZ6rfbYTtm/5kn+fgWdvyCmE60Jv2zHjTIfuVijTA3UV7gZaaE0XvBlk8ey62gxuD2M+hyqdUXQ/i3Uu0gC9TbJDrIrTnJIGKMmFTp4nREV43XOmS3wLOPH0IH+CD0bAuXRW5x7M9Mrg0FRGcrbu/cbR4xR+Zb8V6hxenbuvlqYbUgDwyK4alWilnwggtC3skSGCY6A71ifJ//oqj+gwxNWFsY2kbaPDTlEyy0cC/UmtbmPQH21Mj7Ud2Nyu595zPo=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70ABoeq9Nfm1UGflNT+lh7bzksWxLLukv0tedlBRc7x7xXHt7CCyWb3OKurPC9XB444W3yKC4B+cAKd4hSX+sjrGmmuJjdKMIXm0x86BUrGGiCQsNQ4nrCnhP/g8CcxpIv/lUInywQn1tf+kpLjB2XKzNIXXIS7VZhpgCJo+w4PkuVxV3oqblwUqvoahNv3T2JDKHIU32rUjxaV/LT6aN3PwbAHl8F+iFO6yBaSWLjUdxq0ARq4LgX7vd0GWoHM50f7GqS8tYM0r/XrgW9OykzPg0ZWHRg9UgIL7Qtb92ITOALRTQpsxjlrCJ7+OaD85IWE6IShWcrBmLj1QeVaJtICxDLlpuWYoYZGkoRigoHaEejdQD0mPJX0s2GiTQu0tWHi1QcbDZ76cM/pjzP8MpbKMgBVOxp1kUL3doSW2z1XNHpq03tQ0kplh29+hi2ry/tbNiLddE5cVu6qNwP2HAeENi5aiS/YQBev+PA/DJdRCwlrUm+jnYR+1jkmBVoC8hn8g21lmRk3PZS3IurEL2fX9Aeb6CQxGHcmoWDuTWFA7tVodTWdqwiTtn+aJSRbEP+qGjPOOuZd2SrxoTSIUsj44sBOHqcB0pmoQc9u6ZVAZFQew4UIoDBDpbcYjt3M95skA3/Pqu829liUbmoWim1JQXXszenpXsJTeyaUIA5mFUNUQG4PjU4joxsvvV9LZ+Bg==</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="TSCode">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf93X9wKhEr+N/4BGZfQRIOgESXcKYukFL72EZMxSNKVa6oQh7ChuyqbOn7Ujdi6N8m7fdhwsratzUsXwH2+r+JiRmRLg2FBfuURQoH+LZiHmP0WukWqr290bp7YaHhm773xEtz5bWBNcjESjlh4CKh4YfzOpNnH+9crwCZPGW7mjI6MpqOmg08PA6o/+fhx8AJK02bH2SD5eFSpf2t0AF1Piz6GBVlliM7wW6S9AyVXsHpMDWPvI8gjz/zPAUC2i5cjLzcSzyRkHfiyJsCue1NyWxcLJJAlwENB+U9xElSbncGdL7lblQeIJBMFOAcwkog==</encrypted>]]>
      </text>
    </action>

    <action id="Department">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK4zwsjI9OBz4VJlPYLPbm3+dJLoTo+OKBupvU1S5bHwx4kvUvPa+5PxNQonVpJ/OkYppoYgXdUud7rRCRGXJ9P4DCuIzzC69XZ/f91Hz+3pNI4egt+vlDXw53z1lw6ujWTwJO/0qnXLhN1JGZlF9JYHHlbUp4jpaLmF7XpLG+oPb51CX38wqXT8KbqSzwSWGJp/w8CbfJPbVK3tasuCaaoI0rHRvfYKXh3cusUp9BZcfxOngN2pyiRFvA/s3AnWuQg=</encrypted>]]>
      </text>
    </action>
  </response>
</dir>