<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY WhenBalanceBeforeEdit "
if @@view = 0 begin
  declare @$checkVoucherUnit varchar(32)
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
]>

<dir table="mdmvtkho" code="ma_vt, ma_kho" order="ma_vt, ma_kho" xmlns="urn:schemas-fast-com:data-dir">
  <title v="chính sách đặt hàng theo kho" e="Item Site Planning Maintenance"></title>
  <fields>
    <field name="ma_vt" isPrimaryKey="true" allowNulls="false" dataFormatString="@upperCaseFormat">
      <header v="Mã vật tư" e="Item"></header>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1' and kieu_hd &lt;&gt; '0'" check="kieu_hd &lt;&gt; '0'" information="ma_vt$dmvt.ten_vt%l"/>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_kho" isPrimaryKey="true" allowNulls="false">
      <header v="Kho" e="Site"></header>
      <items style="AutoComplete" controller="Site" reference="ten_kho%l" key="ma_dvcs = @@unit and status = '1'&SiteKey;" check="ma_dvcs = @@unit&SiteKey;" information="ma_kho$dmkho.ten_kho%l"/>
    </field>
    <field name="ten_kho%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ty_le" type="Decimal" dataFormatString="##0.00" clientDefault="Default">
      <header v="Tỷ lệ" e="Rate"></header>
      <items style="Numeric"></items>
    </field>
    <field name="muc_do" type="Decimal" dataFormatString="#0" clientDefault="Default">
      <header v="Mức độ" e="Priority"></header>
      <items style="Numeric"></items>
    </field>
    <field name="kieu_hd" dataFormatString="1, 2, 3" clientDefault="1" align="right">
      <header v="Kiểu hoạch định" e="Order Policy"></header>
      <footer v="1 - Rời rạc, 2 - Cỡ lô, 3 - Cố định kỳ đặt hàng" e="1 - Discrete, 2 - Fixed Order Q'ty, 3 - Period Order Q'ty"></footer>
      <items style="Mask"/>
    </field>
    <field name="ton_at" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="Default">
      <header v="Tồn kho an toàn" e="Safety Stock"></header>
      <items style="Numeric"></items>
    </field>
    <field name="co_lo" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="Default">
      <header v="Cỡ lô" e="Lot Size"></header>
      <items style="Numeric"></items>
    </field>
    <field name="so_ngay_dh" type="Decimal" dataFormatString="##0" clientDefault="Default">
      <header v="Số ngày đặt hàng" e="Interval Days"></header>
      <items style="Numeric"></items>
    </field>
    <field name="tg_th" type="Decimal" dataFormatString="##0" clientDefault="Default">
      <header v="Thời gian thực hiện" e="Lead Time"></header>
      <items style="Numeric"></items>
    </field>
    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Còn sử dụng, 0 - Không còn sử dụng" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>
    <field name="dv_yn" type="Boolean" external="true" defaultValue="cast(0 as bit)" hidden="true" readOnly="true" filterSource="Vacant">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 330"/>
      <item value="1101: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>
      <item value="1101: [ma_kho].Label, [ma_kho], [ten_kho%l]"/>
      <item value="110-: [ty_le].Label, [ty_le]"/>
      <item value="110-: [muc_do].Label, [muc_do]"/>
      <item value="1110: [kieu_hd].Label, [kieu_hd], [kieu_hd].Description"/>
      <item value="110-: [ton_at].Label, [ton_at]"/>
      <item value="110-: [co_lo].Label, [co_lo]"/>
      <item value="110-: [so_ngay_dh].Label, [so_ngay_dh]"/>
      <item value="110-: [tg_th].Label, [tg_th]"/>
      <item value="1110: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a6aEs9CDKG1l5LVMA32xHb3fo5H/YFkrmgBgukOI3tOLob5uRSrFiH5yM1+hGRDmft8WIPAHbR1r/DmAGZsxgbFnoLvh2mEzxGMeTBk3eW9lZuegj//StE/1/K7zoQH1A==</encrypted>]]>&WhenBalanceBeforeEdit;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf3NRpUadENUhghGHTcGQ5B6ZBwzJ1Lv66umdAlaQgen0DUIH1YIiGLQUmw4HKnzV5Q==</encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a6aEs9CDKG1l5LVMA32xHb3fo5H/YFkrmgBgukOI3tOLob5uRSrFiH5yM1+hGRDmft8WIPAHbR1r/DmAGZsxgbFnoLvh2mEzxGMeTBk3eW9lZuegj//StE/1/K7zoQH1A==</encrypted>]]>&WhenBalanceBeforeEdit;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf3NRpUadENUhghGHTcGQ5B6ZBwzJ1Lv66umdAlaQgen0DUIH1YIiGLQUmw4HKnzV5Q==</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZulixeOvpCDPDL7dSXVRsy801VwmU4BJJ/kSM+zioN3BdNE//FxUTHaw++Rdbj7LSX16DEQLVV5HklWIx4x1PVJAE40cwzCGdQ2ixWj17yEDIF700VyO5K2YnRAtO4Z0jqbO5qa3/TEl8ZdmLYAS8P3q/A8o/yCp3YRYgqq2c4kGNS1hJVftNw3EcJqAYr56+PbT+EoK8515poHL9ZDbjc0xznY79UMMPZRPRmD3ohmerGQS8MZh5uipVaeYdkzu7IbXGMI9PfiXk6UAk1FmRzPerGeuUg7MvXhuZwdVMyAWYib7+zcxvl9oj909mU19jl7+G1+UGf0oT4spJuosstx0vCyCYI/Bz/qvW1l6G9bb8P1E/MtHvWuEiQXtgA/FBciuJnGqvIO2PE2htNymr7MIZw==</encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6e+o7A7xg+8sv1icpo45kT2cijH6gal+OIshUGiigqn4Tyty9FxCJXBX+32WWbPQU/PvVojLrcyJ4I0eGiQ8QJjybMdd0JZ7sBdhYwSsGTGWz5aEoHHKpdgEkahgYGH91Qj/xUavdkkiuCTZw3zeXNVerW+sGke8tYsed8SDIKSeTK2qevQule2a5mHCEv9W5lvw5FobpR7R4NLSOz2iEVMkNE0ot99t2mZ1WX9KxCRf</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK4vZG8geyQX0pJ1qS7bKa3c0txTwn/CX2Q7GzZ9yB8gCS2TIPNuoi/1Osvzho2c7jEo/9hshzOObXo9+/NGVFaxzjh0nOLJoLiWgvPii8kerR1DS4BvZYbY+5pHro8sEQLV+UWSgc9RUWh7/HCf+OKweFLZeMgcLfgtxa2tnF8Ti7Y4BH9OBVcvW+kq0mJ8udnawS1cfXWEk3BJevpYT5St1x/rIf9d4zgd9hKYuX5s/tpQ0ToqQ78arRf0T32dC4A=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jCXWUmDo4f8DbrHusvtW9/MjUeTTQxYZv/z9pt/WelaXWk5+2npJLJua+7x4iVSBOW+UbbjfCMCWQExlUT5zA9Hy+wNnHq+0P9ofdODACj1cAeRw9otRNaA9MSZssGjLRI4oFlGha1nDMcw2rXrdbpiT78m4Q4QOO+d2DoLkHD906RvSwfs/Zg5j0U77VjKscW27f+Xn2L8yJCOpxc6JMPZFeF5BDdU3dkVgSt1WPBloFilYa12eJVBLw028AWaPR</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbevBjU+frxqBRycPXIceTagwZOjSqQp7bf4tKbuAJVDTCTGjRXkNjsH8YTB8BRsF7Vg==</encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a6aEs9CDKG1l5LVMA32xHbRlm35iB6NXDlnsXzsD2LVMn5Vr0FCXCq1N+zGzi/YldXhYNp1I3kUb3Afh4dG69BtmrbuFpM17ZQZ6PU6//m5G8mqFAA7FldAGZa/51F3uteUgPVI5FMP9vH8+XDteDZoIeDMIq90yMiHBuyNDT0555UyEShqfV/k9iwNVPd62RP2l15bjcKyOE/OLmvRsI/G+7k6v0jcd18AsthznHEyhhpBFUnwPTmYBnDUOxKSdHwQULDQu0j85w0ZO4kcLnv1Nka45xlJWph3UKM6Z8MFndjMTSBpHXzh3FVIt0Iibg==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70O0wy9SVvmau+gtMzpgUrhdbp1/ydirXt36DCJz+D4bX3/Jx+72L64EQsmbRNaZHw9ySl0cKqX7Y6W3qKyF56HYU2GrmoHD71qwODiKeoQxOK0wKFa0n6bLyNnp/ns9zj1wZ0UZo0eqij4xAwlm9Bnt3h1/E1qPYdEkLcsCQ9V3mietJTBRfaAHeF93Q7FXOWg==</encrypted>]]>
    </text>

  </script>
</dir>