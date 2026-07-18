<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY WhenBalanceBeforeEdit "
if @@view = 0 begin
  declare @$checkVoucherUnit varchar(32), @$lockedDate nvarchar(512)
  if @@action = 'Edit' begin
    select @$checkVoucherUnit = ma_dvcs from dmkho where ma_kho = @ma_kho
    if @@admin &lt;&gt; 1 begin
      if not exists(select 1 from sysunitrights where user_id = @@userID and ma_dvcs = @$checkVoucherUnit and r_edit = 1) begin
        select @message as script, '$NotAuthorized' as message
        return
      end
    end
    select @$lockedDate = case when @@language = 'v' then N'Đã khóa số liệu, kiểm tra lại ngày khóa sổ.' else N'Data is locked, you must modify system locked date.' end
    if exists(select 1 from dmdvcsks where ma_dvcs = @$checkVoucherUnit and year(ngay_ks) >= (select nam_bd from dmstt)) begin
      select @message as script, @$lockedDate as message
      return
    end
  end
end">
  <!ENTITY SiteKey " and (not exists(select 1 from syssiterights where user_id = @@userID) or ma_kho in (select ma_kho from syssiterights where user_id = @@userID))">
]>

<dir table="cdlo" code="nam, ma_vt, ma_kho, ma_vi_tri, ma_lo" order="nam, ma_vt, ma_kho, ma_vi_tri, ma_lo" xmlns="urn:schemas-fast-com:data-dir">
  <title v="tồn kho đầu kỳ" e="Stock Opening Balance"></title>
  <fields>
    <field name="nam" isPrimaryKey="true" type="Decimal" width="80" readOnly="true" hidden="true" allowSorting="true" allowFilter="true" allowNulls="false" dataFormatString="####">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_vt" isPrimaryKey="true" allowNulls ="false">
      <header v="Mã vật tư" e="Item"></header>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1' and gia_ton &lt; &gt; 3" check="gia_ton &lt; &gt; 3" information="ma_vt$dmvt.ten_vt%l" new="Default"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZYrBN+8y/coU/Wwpt8Gu7F0/6je//P29XBx9NhVoDEw+YA2L7/I2Xbsi2PN/h1SdXg==</encrypted>]]></clientScript>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_kho" isPrimaryKey="true" allowNulls ="false">
      <header v="Mã kho" e="Site"></header>
      <items style="AutoComplete" controller="Site" reference="ten_kho%l" key="ma_dvcs = @@unit and status = '1'&SiteKey;" check="ma_dvcs = @@unit&SiteKey;" information="ma_kho$dmkho.ten_kho%l"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZYrBN+8y/coU/Wwpt8Gu7F0v68+51hJsNwFrfSMtO1AkK/5zj8OKGVPasKS81WALUg==</encrypted>]]></clientScript>
    </field>
    <field name="ten_kho%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_vi_tri" isPrimaryKey="true" filterSource="Optional">
      <header v="Mã vị trí" e="Location"></header>
      <items style="AutoComplete" controller="Location" reference="ten_vi_tri%l" key="ma_kho = '{$%c[ma_kho]}' and status = '1'" check="ma_kho = '{$%c[ma_kho]}'" information="ma_vi_tri$dmvitri.ten_vi_tri%l"/>
    </field>
    <field name="ten_vi_tri%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_lo" isPrimaryKey="true" filterSource="Optional">
      <header v="Mã lô" e="Lot"></header>
      <items style="AutoComplete" controller="Lot" reference="ten_lo%l" key="ma_vt = '{$%c[ma_vt]}' and status = '1'" check="ma_vt = '{$%c[ma_vt]}'" information="ma_lo$dmlo.ten_lo%l"/>
    </field>
    <field name="ten_lo%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ton00" type="Decimal" dataFormatString="@quantityInputFormat" align="right">
      <header v="Tồn đầu " e="Opening Quantity"></header>
      <items style="Numeric"/>
    </field>
    <field name="du00" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" align="right">
      <header v="Dư đầu" e="Opening Balance"></header>
      <items style="Numeric"/>
    </field>
    <field name="du_nt00" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" align="right">
      <header v="Dư đầu ngoại tệ" e="FC Opening Balance"></header>
      <items style="Numeric"/>
    </field>
    <field name="gia_ton" type="Int32" dataFormatString="0" external="true" clientDefault="Default" defaultValue="0" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="dv_yn" type="Boolean" external="true" defaultValue="cast(0 as bit)" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="lo_yn" type="Boolean" external="true" defaultValue="cast(0 as bit)" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="vi_tri_yn" type="Boolean" external="true" defaultValue="cast(0 as bit)" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 100, 330, 0"/>
      <item value="111: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>
      <item value="111: [ma_kho].Label, [ma_kho], [ten_kho%l]"/>
      <item value="111: [ma_vi_tri].Label, [ma_vi_tri], [ten_vi_tri%l]"/>
      <item value="111: [ma_lo].Label, [ma_lo], [ten_lo%l]"/>
      <item value="111: [ton00].Label, [ton00], [nam]"/>
      <item value="1111: [du00].Label, [du00], [gia_ton], [dv_yn]"/>
      <item value="1111: [du_nt00].Label, [du_nt00], [lo_yn], [vi_tri_yn]"/>
    </view>

    <view id="Form">
      <item value="120, 100, 330, 0, 0"/>
      <item value="111: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>
      <item value="111: [ma_kho].Label, [ma_kho], [ten_kho%l]"/>
      <item value="11111: [ton00].Label, [ton00], [nam], [ma_vi_tri], [ten_vi_tri%l]"/>
      <item value="11111: [du00].Label, [du00], [gia_ton], [ma_lo], [ten_lo%l]"/>
      <item value="11111: [du_nt00].Label, [du_nt00], [lo_yn], [vi_tri_yn], [dv_yn]"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf7t06LeFFPkx0v2pgOE59vqlMHqTIA+GWHnpiKPehH7VUxxmyM77SrJp5aIqv2vcgcmELynMNq3wr3AsqEfTK7Q=</encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a6aEs9CDKG1l5LVMA32xHY1X8UtDmCQxRKhh6aOFgFa3q8t4B29WBmoXEwhwbrorq85dMEUc4bpMtnUsVtRy/4PaQa4WdLJbu465SienBIMooyD0L+DA9rH+kDpafj1WNYLYi2ny0otxoptFU8zVeLXolcZokkT0h6Nn7sbvDJ1Rqb7shfFJ78YBmvh6fHDyg==</encrypted>]]>&WhenBalanceBeforeEdit;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf3NRpUadENUhghGHTcGQ5B6ZBwzJ1Lv66umdAlaQgen0DUIH1YIiGLQUmw4HKnzV5Q==</encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a6aEs9CDKG1l5LVMA32xHb3fo5H/YFkrmgBgukOI3tOmf7U01vaOUFYyufwSdHK2W6CCn75vubM3YY/KtPc0qx33OMOlRSbwHdReWkoGS+4</encrypted>]]>&WhenBalanceBeforeEdit;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf3NRpUadENUhghGHTcGQ5B6ZBwzJ1Lv66umdAlaQgen0DUIH1YIiGLQUmw4HKnzV5Q==</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfzaAVAljzWNpJ0WTf2zklqZzH3jJ83WteQg0XfS12JbsUsC1dq3nUn6lHwjgC9uAHzHQ3TGQIVIZ9N3/8I7mS1V1/9+84nP/1WARr8i345FM</encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6RRLqhnDeT1KgypE/7fJWgo0slm640ve6VsbMfqTyGJNdARaHuuzgzlmkLnkq8TDb69wpA6ihsb5l8/SG//8O61J0QXVdNhEbGAdFZndnE24WaqbRWZCJFoYl/lNu4qdZNiP5fo4f4/IlGlTPw4hniXGVJQb8AGeynVYaj6w5zDPWiDjoq9EWOzavnp8rEzJeCHz585JShlHSU7wTJhXZFM9PpFNurpT++WxjrfCyMzEAELTHRbPipAoEHcnIBM94caEOBc6C1rQVyCQAb1cd+CzNFmkBBnYakvTatLuOYg2Upr3cskQTrBYi+GC9Ixx37TSz8u+bIZXhaqOhbqndKA=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WaN8MSyJECa5wYt3cvTqaI4TNPzqTjPmaEhODU346NNS4FRV6lZ30K1BukzjQ9bsf3iWBuDhpCXg5ARuSKpgj3WVKGhA7vHVk04pkFmZm/rZs8rpjbZcBEqlZJGeTlWH985MLLulWf2OXw7w9GDNMWsA2r8QrkLI/9/f4tsYo7/5jun7bA2IQ1eglA4vj/k+p7snLniSUj04GYEoBMeSXofYwC8EcObLATe1L/9ARD4BD0xg/KT71wSZdoeULYtW8FDjVNXtW2oh8AtHHlisHwGUMDdXsd9948HoPCKUUTVJ/FDd39bi2J6OHuZ0Kd4Gi4HxSoK4OYHTcFBmTWKUMjeNQ++S79XITu4pYEagkNCqUXeKq5CaxgIUZcb+ECCuHcvHbnooD+mbhxuxK9nWkWFa4EcrhxiRwFeT5GPTHzBdMabppKlDYJ0uta2FVyRMcrcWvysnxdH+1DXjhjTj/Cubap8cUYFV8jaeKSZxBJIP/wQnB7vcoDNPlxL9TbtHd5du0uka9QjLa6D0oo0unJAFLgaqtvu2v4iChaVQryBnW08gMagxlS9lhXxuoVeJveHjJMNXLFnaPMe/baBcx8NDlIEEtVOlOfzLI9x7fjjQ=</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82nFJssn+cBPm60rXisaJgw0tH2dh1q4WwrBb34Hxf2BazO782SVgQsgtjuGChWHGanjT7wlTPASfyVCGzSNOntrwsBi7NUkYEKDGxrxeO+Rvd9p+SeuS4ywYpepONxjxua/g9s75YX2WDIQ3a6oYIwxwHpiCjEIv8ZjwKxHei8VXcbh5U1Ob4+xf4edj8JxaztBIZvZmqUrUEHkShVunvK4w==</encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<encrypted>%IYfbRnGMZu+vvTXZ4br7KmRo54ol5vOnEpdrVadgaudPllJrIQFKbo2h8Tf8LMeFawB7OP2smDDoCBiNCRyFzrnQG/1/Yr7YuGdHWTh1TRYXYUomZLF5iPAl6IEHC9A4hil2BWU5/wlFK67Pj5p6vgUIfDfBlHyJ+KutAigwB6HZabQCiPgbtKTiqnOmpt7r</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jHbjveXsmJ4pkjBvMl7kGE81gubBe0B1ueTRifxICBajjbI6W/ugeN69pPDapP/wq2FbcE6VfmlW+PiJHkKDHL6L+xrWhF9fZMPA8dbX3GbvaoO9t/PwgrQBh2f7YbO8BOk8s9ykxcGqWsX05cei8VVYWi3+Dp8eTzY0/c5e+dsb3j1twx7aH38u0gbaSHacw63pU1UwZlveb9bI6k12VQQXx1cg2J9tYbGfEdfArwEK4e4kns54FRn4xXQF+MVBjkz1jAKp6s+MiFg9HJxoVP3KI9uaM4tuTBVGY2onqTDj+LuQsYqqDe+r+9Rx0XW6fAr7oJkiKQMV0f/eDNbqEAiwG4R+uadUyBCVfG6UKFmZzttA0Er0dqE6+Gw/7rAa9oIGmgrQY77QiDa5Wyn3PGd38gn2MFQs5ok5/guaHT+w=</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbev+SPD20ydJUl3KFBhnojPBuR5nFl0phMPj+z6QNEOOjhmwT2oawoOi+tFKQrlaN8sWLGEFrOCKljXKAXyvAkO8R3ccTmMeBzqNeb4BLqt4Ehtd+OK8Qv7USWDf29sTDDDs86j/ElAMS8uJlFdR2rYWsTk1N0zvqpd9pcM4QRGZvK/iEmg2QcV3lZycEnsQmkOS04pyXFQfgFh33rKmIPUKUHS1YFQgfamJo8rETbinTlNK5pTfym5IQxZINJB8IcA==</encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a6aEs9CDKG1l5LVMA32xHbRlm35iB6NXDlnsXzsD2LVMn5Vr0FCXCq1N+zGzi/YldY/cQXXrhLVL0XmtYQfuCJgd2s+HxSf6SzYv2COyIyXNudt/qHcKL7ZJt9lbwz3M0QU1somXkIhVZktTDKE/+P+rT7gw7+C2i5DSVW+OwA56NSY7CnjvK3+0zp4bZZTrT3dlMaU+zcaDpsIZZzMNxKXnWrKAohGmoAHkLGJ5CoxEUvrINA9Ksv9C79CnBBvIffqKEOQlVvUdjUPlhh1T12ipDr86Ruc0wLEV7mWitPWXVpYMzWIGaERTQ2EQIw/K+joj/LU2SwYsHQfQ8R+DoVhrnb+CryiqHMqjBksMTqEPtIIOHpE0ndYln59M8Gyt+tKxQN2Tiqfvhk9LEDkzTqK8e3bDww70V2f92jG6TprDnvypdjcXv0P9tWfTNJ9pndzx/dbvAWcXQnUPQdN5/vCX76UfMIbpEbPw6oYWMCCVEj/Gq/vm36w65Libg36CIRzvUtwlyDJC1Zly4J/ZvO5CK5asXti4uUzvxeiT/dzfwHibynkyOr0gvj/CTi1/qrEFSZDH4ZPZ7gcjKkuMW50M83MY1cOnweOBeVwe2FuEHXS6lq/EvmZLLvji/i03rJ4ZxHcIDyuQvdZ3hC7GGFTbYnAjdB0UMOr/MG22WGSh1YmPhMWgcH3Bba+s7kVmr5R+BhlSDfQC4eycEbm259rDJBWZRZLQU0+MqIEebtUUt4XUHDRZde3UGvg7aoICflU18zZuJ6MVU24QjP1k04=</encrypted>]]>
      </text>
    </command>

    <command event="Deleted">
      <text>
        <![CDATA[<encrypted>%IYfbRnGMZu+vvTXZ4br7KmRo54ol5vOnEpdrVadgaudPllJrIQFKbo2h8Tf8LMeFawB7OP2smDDoCBiNCRyFzhy6lSrceBHObbb8fNvcT55yf4eeIMpduvg0PvLMrROg</encrypted>]]>
      </text>
    </command>

  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70FU+vVRD9MAiT40fyPJ1UwGdim7Q8gl1GwVC4I8h3cEHPmcPjd/wy/0rsPnyCO0h+GkYJAHNl0D0L7BDw9ngMDLA+tkeRNhpF75vR3BortSiAe4caZI9AapOpSjM7IHy0/F/Xd2jLftflRqw+C2exSqt31+dHzL3q1zzD2G2swl0SFVbZzwg92TFymDe75FaweDlqXa2bjKqgmau7LlCE7K/fcVqaS/OOhy7xvZPyZalKH1HIpyb3mfzFFvqy3486Qaysx9Uw55PL0dLJJRFDqD2YPETaioNGSoo5VknVR51iI3YcAODVUOwbl1YjyMBV67bjwzbg8vSpT+ZgxT8XyiQ+MsI1VKxXYUpYvUQdS1T2reZvOZp3rBfwfxLFIr22qMEFF6XkiuPdVYnlMag2wykiyLGd0C8TpHgzYPmUmKJUTkUe7wtK1+Y95618K9OYT03FTdb6jKAkw6qochn9LPgNIG2WYPw2fzOHn67Fp0ecH6vXgXxEdd6iegznw95b3fnv+e4ecqtYXFe5gXBmixp8LCaNhqRzcoSCrvwPks28EvbH2Frb3+roD4M8yNQn2JrnfWG9/S8aGSpI0BY8LNg8jlCdQY1/PsSBPOYy9KDfyTpk2uN87NnZbmvuYOtRfFWmCAJeuLvOdyb9slbd45UjW2pGWEQ8hCoTjIFH0Dd6pWn8po7dT7LUnWmZxV53kzT1h+/Ju1KvuZglpbN4xIo70bm7z/6YWr4s4cmMEWikawGvtN9JghY09R1pv9OlIitfriEd3+dF8bNhztgQXz53lFuL3Xw7rtF9LI1Q8q+Yy66345bvX7x0HZN1dP2SQfQYa+pbMPqFiIWHK2gtVmldFL2ASHmY18Pom9mVMNplDgDIkkUrxcuK8PnOF9Qd1NBtvOUcjXtHkRILCFGAOPasv4iU0I4ZFmYlr7hXoyW5FSiRzytKxAr825XQ0FRbh5tdJ+ujtxg9UdFU6tHCWXzQ9ASKaLZT7yI3wojRuVaWyOGMkHgOHFToIpDKM3ZsfcD++24j/soWW984+UgAt4=</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="Item">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK6+INkQWNmjEwlPl+HrVfmFbZmcLoLaTcoJ3VP26WNLB68m7x11wTUK0vt9E6NU9xanuLREK6qTjyLhO9H20+4f</encrypted>]]>
      </text>
    </action>

    <action id="Site">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfwiJFTp716WGUT+dOSl6JLyhU2V5kcjVLfYU47Q4Zfk3sImhBOotbX7TJiMbrAdYbmNJPHACWnlZCqwzchNJiub+b+gnU1ChJ2sm1+OjNtzUb9rSD/gZdrxka+SvfuG+HD9QTyE0+BwIAyFs57lG8Vw=</encrypted>]]>
      </text>
    </action>

  </response>

</dir>