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
  end
end">
  <!ENTITY SiteKey " and (not exists(select 1 from syssiterights where user_id = @@userID) or ma_kho in (select ma_kho from syssiterights where user_id = @@userID))">
  <!ENTITY AfterUpdate "
declare @rate numeric(16, 5), @qRound tinyint, @date smalldatetime
select @qRound = cast(val as tinyint) from options where lower(name) = 'm_round_sl'
select @date = ngay_ct from kkyc where stt_rec = @stt_rec
select @rate = he_so from dmqddvt where (ma_vt = @ma_vt or ma_vt = '*') and dvt = @dvt
select @rate = isnull(@rate, 1)
update @@table set ngay_ct = @date, he_so = @rate, sl_qd = round((so_luong * @rate), @qRound), sl_qd1 = round((so_luong1 * @rate), @qRound), sl_qd2 = round((so_luong2 * @rate), @qRound), sl_qd3 = round((so_luong3 * @rate), @qRound) where stt_rec = @stt_rec and ma_vt = @ma_vt and ma_kho = @ma_kho and ma_vi_tri = @ma_vi_tri and ma_lo = @ma_lo and dvt = @dvt">
]>

<dir table="kkdc" code="stt_rec, ma_kho, ma_vi_tri, ma_vt, dvt, ma_lo" order="so_ct, ngay_ct, ma_kho, ma_vi_tri, ma_vt, dvt, ma_lo" xmlns="urn:schemas-fast-com:data-dir">
  <title v="điều chỉnh số liệu" e="Stocktaking Adjustment"></title>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_kho" isPrimaryKey="true" allowNulls ="false">
      <header v="Kho" e="Site"></header>
      <items style="AutoComplete" controller="Site" reference="ten_kho%l" key="exists(select 1 from kkycct where stt_rec = '{$%c[stt_rec]}' and kkycct.ma_kho = dmkho.ma_kho) and ma_dvcs = @@unit and status = '1'&SiteKey;" check="exists(select 1 from kkycct where stt_rec = '{$%c[stt_rec]}' and kkycct.ma_kho = dmkho.ma_kho) and ma_dvcs = @@unit&SiteKey;" information="ma_kho$dmkho.ten_kho%l"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZUnJmckOZynId3YDBPtZaUk33+t2MydLDmeNtb3vhNjOHSvn/jIl7TX+CVRpDmLsEmIKeRuHWrjbQd7bWFpCNqs=</encrypted>]]></clientScript>
    </field>
    <field name="ten_kho%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_vi_tri" isPrimaryKey="true" inactivate="true">
      <header v="Vị trí" e="Location"></header>
      <items style="AutoComplete" controller="Location" reference="ten_vi_tri%l" key="ma_kho = '{$%c[ma_kho]}' and status = '1'" check="ma_kho = '{$%c[ma_kho]}'" information="ma_vi_tri$dmvitri.ten_vi_tri%l"/>
    </field>
    <field name="ten_vi_tri%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="ma_vt" isPrimaryKey="true" allowNulls ="false">
      <header v="Vật tư" e="Item"></header>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1'" check="1=1" information="ma_vt$dmvt.ten_vt%l" new="Default"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZUnJmckOZynId3YDBPtZaUk33+t2MydLDmeNtb3vhNjOHSvn/jIl7TX+CVRpDmLsEmIKeRuHWrjbQd7bWFpCNqs=</encrypted>]]></clientScript>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="dvt" isPrimaryKey="true" allowNulls="false" inactivate="true">
      <header v="Đvt" e="UOM"></header>
      <items style="AutoComplete" controller="UOMItem" reference="ten_dvt%l" key="ma_vt = '{$%c[ma_vt]}' or ma_vt ='*'" information="dvt$vdmvtqddvt.ten_dvt%l" normal="true"/>
    </field>
    <field name="ten_dvt%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="ma_lo" isPrimaryKey="true">
      <header v="Lô" e="Lot"></header>
      <items style="AutoComplete" controller="Lot" reference="ten_lo%l" key="ma_vt = '{$%c[ma_vt]}' and status = '1'" check="ma_vt = '{$%c[ma_vt]}'" information="ma_lo$dmlo.ten_lo%l"/>
    </field>
    <field name="ten_lo%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="so_luong1" type="Decimal" dataFormatString="@quantityInputFormat">
      <header v="Sl chất lượng tốt" e="Good Quality"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZUnJmckOZynId3YDBPtZaUk33+t2MydLDmeNtb3vhNjOHSvn/jIl7TX+CVRpDmLsEmIKeRuHWrjbQd7bWFpCNqs=</encrypted>]]></clientScript>
    </field>
    <field name="so_luong2" type="Decimal" dataFormatString="@quantityInputFormat">
      <header v="Sl kém phẩm chất" e="Bad Quality"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZUnJmckOZynId3YDBPtZaUk33+t2MydLDmeNtb3vhNjOHSvn/jIl7TX+CVRpDmLsEmIKeRuHWrjbQd7bWFpCNqs=</encrypted>]]></clientScript>
    </field>
    <field name="so_luong3" type="Decimal" dataFormatString="@quantityInputFormat">
      <header v="Sl mất phẩm chất" e="Deteriorating Quality"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZUnJmckOZynId3YDBPtZaUk33+t2MydLDmeNtb3vhNjOHSvn/jIl7TX+CVRpDmLsEmIKeRuHWrjbQd7bWFpCNqs=</encrypted>]]></clientScript>
    </field>
    <field name="so_luong" type="Decimal" dataFormatString="@quantityInputFormat" inactivate="true">
      <header v="Số lượng " e="Quantity"></header>
      <items style="Numeric"/>
    </field>
    <field name="ghi_chu">
      <header v="Ghi chú" e="Note"></header>
    </field>
    <field name="nhieu_dvt" type="Boolean" readOnly="true" external="true" defaultValue="cast(0 as bit)" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="dv_yn" type="Boolean" external="true" defaultValue="cast(0 as bit)" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 40, 60, 100, 230, 0"/>
      <item value="110101: [ma_kho].Label, [ma_kho], [ten_kho%l], [stt_rec]"/>
      <item value="11010: [ma_vi_tri].Label, [ma_vi_tri], [ten_vi_tri%l]"/>
      <item value="11010: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>
      <item value="110101: [dvt].Label, [dvt], [ten_dvt%l], [nhieu_dvt]"/>
      <item value="110101: [ma_lo].Label, [ma_lo], [ten_lo%l], [dv_yn]"/>
      <item value="110: [so_luong1].Label, [so_luong1]"/>
      <item value="110: [so_luong2].Label, [so_luong2]"/>
      <item value="110: [so_luong3].Label, [so_luong3]"/>
      <item value="110: [so_luong].Label, [so_luong]"/>
      <item value="11000: [ghi_chu].Label, [ghi_chu]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a6aEs9CDKG1l5LVMA32xHb3fo5H/YFkrmgBgukOI3tOLL9ZQX+JDJnu2s7NgsoN5365iKv+hNu0A2/woi9vWIC7EF97FNjzWLNSbaUorWqXTgFM8Nvt5m8w4AstZ7c5Bg==</encrypted>]]>&WhenBalanceBeforeEdit;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf3NRpUadENUhghGHTcGQ5B6ZBwzJ1Lv66umdAlaQgen0DUIH1YIiGLQUmw4HKnzV5Q==</encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a6aEs9CDKG1l5LVMA32xHb3fo5H/YFkrmgBgukOI3tOLL9ZQX+JDJnu2s7NgsoN5365iKv+hNu0A2/woi9vWIDVD2gvg10TIozl+sgjg7IiAki+2ILgHNacqBDW7xJRZQ==</encrypted>]]>&WhenBalanceBeforeEdit;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf3NRpUadENUhghGHTcGQ5B6ZBwzJ1Lv66umdAlaQgen0DUIH1YIiGLQUmw4HKnzV5Q==</encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6RRLqhnDeT1KgypE/7fJWgoQDAWLcWRyF9yDeFSnmK8H/2e5gl5wNei6/qBJ6gEqA8XQVgU9Oi3HCJNoI3ARUBqx9DltsKcOPQ7XdO7CL6aTZ0Vwz6aselc8OxuFoi7SPJ0PFu/cdLqOc+dDG4JZInszquqJRH1sVpBteo4RQNtOFuVyKz3buMgGzdelpo8k1QIdFpU5EkmoOIKAZpGGXHMFqiWcZzPc623anA3RArSG+TAGLfEO5X4DDeZcoGcidelYVpUz3Ye4aZ+L65a8ibo=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZuliDHM40QpvMHWFEm7nU9iXtRa/LovLRF7BI5fDpOp0/ct+iv1TayrZ3M6awS5oQY0lVotr7ROnrA4RXLJT1PlofLP11Bqqdt1t1vDZt7K/fCrdiOFUq4wEosrQHqtYkn1f835uhFDXUrB4/Ayi29YP0bXAkj+2Z/o6umbyYahldGy3e73kaXN/PZV3rP1uzdUlahluNKZGdfPPmYIGtvA8P6R8OpTPPy1JPbtLSklbQfn2GI0syB8Ut76IiB6gMnTVr3lJuy/Fh8e3dCX5HumG7hvPLajDM1LVFU+N3aCYsW/+18zXDbuHbjOIT2y2ZpN31avZEyCIycnwtE+JsvmJhUnPiOR0zd6Q9R8mBma+YagUjKm86wM8zmAWm4Pk2sAaia/fmKIwKv1xalYpd9L4Dw==</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82n0ob5zXQy72Mi8+VsqJ5Q271jZTndCezwo6OJKnIKsqYgqkPSGf2sIyjmAFzEtrPwUBgA8SZFOBhBUbhvWtwMHEHOz7PR/ymNJRNKwsfs7oQCQwV/okQ3Ssvp5rpWu6Nqhmg27nEppXfwTOdUX4yu3kOgw6CHcIjwzesog+SVq+ZyxV9JP3GVjD/bmISwVznjTjBK89+p7q6s/9b5PbH6mg==</encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        &AfterUpdate;
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jQk4zwK0lrw3EQTrbKSKixKn3YCRDLz3CUeDkpwW+dWw4K+613lZ0Yc2wqEy8lRNGozg1ryny9tAoV05HPzcBok7YC6ft49mwsH9pLduBV2CbRw2NdXKwIR05YrlmJrvU+BtlKQj5Iv3wxIAsDNhEJ4PEoHK38BLMruBUR2gyNbUHoldbP+Z5a2mPIoy32V77oniNe1ZJV4x7RywO5GZFnBXW7XOI0FUn1Bao+5HQb/y5ANu4nFrRoQo91cN4f7ECIHhL4iv/d7Eww55ASoBpdZ6wWerxZbN6Ktir7XkLgyQBtTYgTaOVtiSRkQmOyg/T33ZykqEjHWr52HK4TxO/RA==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%heK0EsYkYNYDu+zfwh3z/BkPHGSJUg54y3V0uD3K0wOkEX0UAqp9tRkOZeSAYj/Q4GYAYOxVW34RmhlL5yKhTPXb7BNoezISnrV5/GijalrkSBilZC8eeLBgog45bVVFjf4Il+GV2FwePa5pKGqWFoNUjRwkm8vdMF/xvftNaDDZs0gECu9MQ7o5mL+7+n0b</encrypted>]]>
        &AfterUpdate;
      </text>
    </command>

    <command event="Deleting">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a6aEs9CDKG1l5LVMA32xHbRlm35iB6NXDlnsXzsD2LVMn5Vr0FCXCq1N+zGzi/YldY/cQXXrhLVL0XmtYQfuCJgd2s+HxSf6SzYv2COyIyXNudt/qHcKL7ZJt9lbwz3M0QU1somXkIhVZktTDKE/+P+rT7gw7+C2i5DSVW+OwA56NSY7CnjvK3+0zp4bZZTrT3dlMaU+zcaDpsIZZzMNxKXnWrKAohGmoAHkLGJ5CoxEUvrINA9Ksv9C79CnBBvIffqKEOQlVvUdjUPlhh1T12ipDr86Ruc0wLEV7mWitPWpY2Qwjnv1BcEF1/03vrjeiPXE9cAmhfNJz4TEXTYKrc=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70GgWIVPgeWBMij7JmmNaqypqjj4/5l9tpCNxK6XgUv1e/XAJ0LeSSxOSVCVchHbRaYAAwHaT3EdYuZSQPvNy1OueZDxdSdVLuGmYPooP+6lnZRCGQZyGlaTx40FfSuaIzrwOhkcOe/LzLqbhyJ4IG1ZMjFBq7plMZz4hRt8ttzga4h1KtMGhRXavlh3Tywks0JoR+z3BxhyhThi4W7VaBTPLDD4KrpaOt4kz1UPqNcseoJ4Wwd6jlQyNv/jfPu9pZ2R3ZVH1y75ptQ44jR23WY1UO1Uu8kkes0exypyToCRCnSFjcsdIYEs7/l3p+Tyw9IBTDcsxGHmr2RDgKmKPPT2f4HlVU2FV1eUGX7lXpcpIEHRRkuVixIusgq2D0mBlZcLFnKGIhaMNjV49uNMlOQEylXvVmn21MAbfE8edGhRNaneEnaQtCIWEj3Qrq3FDPVRsYpvy243i9JYDfZvLkhKf+DZK/1S1hKVAL/OOC7cpfde7xUOsllZknOg8Fa6FQAbcN0pfkj010huiRHKTzN06GHi6jVSvcVG0XuwBwRXNciyNVx9nZysJurQUU2GdSjbl8zOO0JyMTDZ042UlQqdPenhvvTt/aF7cnet09bat2zEHMbE3HBNsVmYvRDnk305ca+aeQY1uuoeMk1y6TzXR4yDSAIeZfMvmZltLXaLdqFgZaUZZ9il4ftxY+Sv/KVJif1K9X9r2u4Ir9v6O656VBX+b195AAZ8gC95sh3OLlvC21+QnrWn2AXnW+nsm0u6Tu4edIbLIAcGvVIPbqvTxyCudrU+DUFW8ueXLrMMiOVKvtV99ReqQOSryiNKWW6skYFKaGA3s+0t3EaOp1pXXnWTsON7N9Lp89vhTuOi+LjFzc2tRB4PgrHP0ybSMZpwK9qYQ4bQtbVDKdop0JZ6/UaM5PnO/djjqQY8nD62/okRh1lUkYIV+2o3Vr6lmwGyEoPLo3QYzpGufQEiExOk=</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="Item">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK6+INkQWNmjEwlPl+HrVfmFbZmcLoLaTcoJ3VP26WNLB0fkFBlTg4aNqUgTXZEebRR9/hO5IfyyAGIM+5acTIJ+gkRUosVrxayV7KG9LutCZOPy1pbari0RKckzV+1JPLDAQKUnprZCEkib77mY6MUhLspErG3GGM+whdbvBvNhog==</encrypted>]]>
      </text>
    </action>
  </response>
</dir>