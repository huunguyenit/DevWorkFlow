<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY k0 "@ngay_ct1 = $ngay_ct1.OldValue and @ngay_ct2 = $ngay_ct2.OldValue and @ma_vt = $ma_vt.OldValue and @ma_kho = $ma_kho.OldValue">
  <!ENTITY k1 "ngay_ct1 = @ngay_ct1 and ngay_ct2 = @ngay_ct2 and ma_vt = @ma_vt and ma_kho = @ma_kho">
  <!ENTITY k2 "ngay_ct1 = $ngay_ct1.OldValue and ngay_ct2 = $ngay_ct2.OldValue and ma_vt = $ma_vt.OldValue and ma_kho = $ma_kho.OldValue">

  <!ENTITY AfterUpdate "
declare @rate numeric(16, 5)
select @rate = he_so from dmqddvt where (ma_vt = @ma_vt or ma_vt = '*') and dvt = @dvt
select @rate = isnull(@rate, 1)
update @@table set he_so = @rate where &k1;">

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

<dir table="mdbbh" code="ngay_ct1, ngay_ct2, ma_vt, ma_kho" order="ngay_ct1, ngay_ct2, ma_vt, ma_kho" xmlns="urn:schemas-fast-com:data-dir">
  <title v="dự báo bán hàng" e="Sales Forecast"></title>
  <fields>
    <field name="ngay_ct1" isPrimaryKey="true" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày bắt đầu" e="Start Date"></header>
    </field>
    <field name="ngay_ct2" isPrimaryKey="true" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày kết thúc" e="End Date"></header>
    </field>
    <field name="ma_vt" isPrimaryKey="true" allowNulls="false">
      <header v="Mã vật tư" e="Item"></header>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="kieu_hd &lt;&gt; '0' and status = '1'" check="kieu_hd &lt;&gt; '0' " information="ma_vt$dmvt.ten_vt%l" new="Default"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZTVQq/5J6aqrrBgE40aT4AuktvBe6CNfm2Gz8ex6E/li2j5RN/PFs4rL9nhfBko5PA==</encrypted>]]></clientScript>
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
    <field name="so_luong" type="Decimal" dataFormatString="@quantityInputFormat">
      <header v="Số lượng" e="Quantity"></header>
      <items style="Numeric"/>
    </field>
    <field name="dvt" width="100" allowNulls="false" inactivate="true">
      <header v="Đvt" e="UOM"></header>
      <items style="AutoComplete" controller="UOMItem" reference="ten_dvt%l" key="ma_vt = '{$%c[ma_vt]}' or ma_vt ='*'" information="dvt$vdmvtqddvt.ten_dvt%l" normal="true"/>
    </field>
    <field name="ten_dvt%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="nhieu_dvt" type="Boolean" readOnly="true" external="true" defaultValue="cast(0 as bit)" hidden="true" filterSource="Vacant">
      <header v="" e=""></header>
    </field>
    <field name="dv_yn" type="Boolean" external="true" defaultValue="cast(0 as bit)" hidden="true" readOnly="true" filterSource="Vacant">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 100, 330"/>
      <item value="11: [ngay_ct1].Label, [ngay_ct1]"/>
      <item value="11: [ngay_ct2].Label, [ngay_ct2]"/>
      <item value="111: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>
      <item value="111: [ma_kho].Label, [ma_kho], [ten_kho%l]"/>
      <item value="11: [so_luong].Label, [so_luong]"/>
      <item value="111: [dvt].Label, [dvt], [ten_dvt%l]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a6aEs9CDKG1l5LVMA32xHb3fo5H/YFkrmgBgukOI3tOLob5uRSrFiH5yM1+hGRDmTWEfs3QSFDFFY+eJPf7mKSLTHWnXCljHb2xvETVsOVbeqZnc/3QG4KMMdx8+Ct34w==</encrypted>]]>&WhenBalanceBeforeEdit;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf3NRpUadENUhghGHTcGQ5B6ZBwzJ1Lv66umdAlaQgen0DUIH1YIiGLQUmw4HKnzV5Q==</encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a6aEs9CDKG1l5LVMA32xHb3fo5H/YFkrmgBgukOI3tOqfnwVd0w1j0WaGTrPD1XqHG6WdKrYhfCH8wkGKSsZwzYPsYhkg38pVmGGabz04jIbXkOKU99GWqkQk1cthFJ4A==</encrypted>]]>&WhenBalanceBeforeEdit;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf3NRpUadENUhghGHTcGQ5B6ZBwzJ1Lv66umdAlaQgen0DUIH1YIiGLQUmw4HKnzV5Q==</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf2K7Dj9/X/ZYwDDVhsN8eNpxBPF7aubw3007FK6HryvqJphUyE77mzYkIJnPjhXmrRXOBVY/nIQOqpT53R8z1KnKC6OoYGNyySpp8oMci+97</encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6cFl2Q5RK/TiOuAq3qbDNycwrzWSw/X+bhtIuqOyV9bL3nM+wwck/yxkKFEgqwDci6iA5PjshUkxG4hHhyI+aTN56/lf84TG9bq21B8UkmRa2a9qWYYRKTr2yWZv4+A9q0Rx+uML47uEHC80ay7yroPEM67eN4F/37P0ltVhzoL3dK7pOETSUSb/HosBEW6A0zNt5vKlbZBdqNq85vETgUZwvt4M2GLvMk8+2VqjJ8ZiajSa7EMJ0fBLDg3NPOx0eVWvUhuunQnAFHTjkSdi1LsEtS98+53yJm6eS3dy1Yzyb3dgIfVhLlzO4WegM0nq3w==</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZuliPhgtVplSgH9j+Q+DJyGRNFmm+abyVJEdNKphB2/mNBls0rw+1ZKaZ7nC97YsGsqS5vaIT8C8/uIH4JzC/dhWvItz2/PDW0/6AVeSMFb1BoTcIzL7PvsC2P4SCLagCuycYD2hxrDgRpVgCal1EsmQ8xVhUuYSPWe/lrixSrrCVQA44Av04rylcYv6C9DVzcI2Kh1mRQTUY2oOb2CBqPxL7jSEcROATTBM8jxggYa1pNXXYXA7h5ns0qtkBDsIafEBXybGseTOBxDncBaGDtS6zvC5Mu/f4+zWF1Aoa/xgPqzCKRWDxTXTAoMWXvw1uHB2+U3PIakT4oScHs3zMJsfB+oQdFhJB/qAsaFGA5zNx9cWvNzSnp9JXvbLcSW/qPcRi5/gpPXdq7+vTzS2nPnK9l9hpEWPzSfKYXAcb5cifxieqHX84/nd3i8PhpIsuHHQhgGemLY3n2OBfHi02s2Buw==</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK4vZG8geyQX0pJ1qS7bKa3chGulZx9js/QAMlXiOyoG+w==</encrypted>]]>&k1;<![CDATA[<encrypted>%cnASWSum4IkRBTbKLOi8cJVq/W3U2V2knI3FJr3nNj+VS72APKRTotgRP6oYPM3Lke+nPxqjEgA3vcM/l4pwauVV4qo1wZ1fs8heUXZAPk4xaEdNZmlJIWR1SM0OBUbPGEMnLXvqkWE05BParSSc1tsC0PtqHvC1yfs94sR/JBTcMksr+RakF31VXWeWYgjcyQpdlcikwJ8R8829gaLpIaVzXsQh+i8CKz4ceSAGXT2/bvDAd8C+3BGs7v9BoU8uOaVQNwU52ODX5Y3if+zBKRJBVYDZDKo1M3pKOwdgbOg=</encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        &AfterUpdate;
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jHIfhvN/FgzGs7XWCpp4tNw==</encrypted>]]>&k2;<![CDATA[<encrypted>%cnASWSum4IkRBTbKLOi8cJVq/W3U2V2knI3FJr3nNj+VS72APKRTotgRP6oYPM3Lt8z17/P7aPwVc519HHUzyWDmKb7gpst4Fnsljw9uJVrmWApEF/zilg9TNDSR/ZtL7Q8WwZX80GX5yPoSYVv8tJYlVCehMAYl10oAMfKfUVXTxfL9pKY2GcUhgNaTrZ8HBAaXhg0IK3QxJ3IsOUcUFcJt3XnTUx950ufbXDRCNpumTYQ9Gh4rB925quPmmp+GyLthaO+KRWOS/4bDEVNWgGMGqgoRZ8Snm9K1BRZZRvI=</encrypted>]]>&k0;<![CDATA[<encrypted>%cnASWSum4IkRBTbKLOi8cE/hpETWHna8gLwEu3sbtN4/gTNFFQu0uenpQvEOpfKo64C+/GJR6A+stLGmvWCenQWjmiZXH5Ms/sggehN2p6w=</encrypted>]]>&k2;<![CDATA[<encrypted>%ShDm4LooPFnWfxWGAKIehxn5IEU5hwC3K054s/5gYTI=</encrypted>]]>&k1;<![CDATA[<encrypted>%ynJ3B2IMttZ3swIzstMMYbqlZD4zfaX6Mwe4vIA/i8ZW4vF7yfqVHMU4eJCSaOcZ6X6ZHiSdAbUwf0ROz73DZarR3NxWW1BKZuGpqgF8EVDoJEx+80/Tze+kufaoHLf573Gc8awM9hZ5jImqq1UOujukeLHIyDLSdhl6GAjuCm+UPJa1ls9UPoU9e7ifxOj2fwjqWqUp4ujT5ovvwvgM1SUHB3rNUfoh8OzO+ttg9Rs=</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbeqMboCxcWZPqmgVHI4rxdBdE5v2XLyIc5gSWiGIG4xro</encrypted>]]>&k1;
        &AfterUpdate;
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
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70O0wy9SVvmau+gtMzpgUrhd4ry9WqH4cy0NW5E43LMBsdCWVr+LoR+tjgnW8QNvYVPTHWXHQPziO53QXQyOIZ8RFbQO1PryyGjohc+Ibp/HhJqAvMLHKKP1FPPYp5seR6OP+cJpFJu9BvrglH2hz9Oq07oDT/5o+P5DPp8DnKNoEgZJaNsbgWXg7E5pepMSmjwLQizTCWemuyGDmglhKbtDZZTXAdAOhykHEY6atb+7tEGYgjAJ8x3KA/TDIzsTZQ/gVWDVqN+GNkRVC/DInBTCiXbnuqz2axAVAXTLZ7QeN/GJt0paP0Iz46cxAJl1iMBhKf+/Ea8AfSxXPSSE73ocZXPS7v//SaCTrAZHVz/LZaml9Q94GRe4T2ZUXKXn9q5nPQGwUXOrs/xaLkney98W6bOpCOnEVx9DIwmxZd1a+Oetgs1S8fH9AImT3TlgyTVEj88mdfkidLdcY3jT00X3HXNdTquZZvyDiahJu+HUNgOHswNDbc50da0g/QU/r4S57F/4G0PTKh5eseFwbqCs3gR0LJ6ou17KgxHKVaul5sIXKd7a173ffcdBdLWDHsYJJXMThe+4ois+A9Ns++8agtceQTrW9ctcwknkeUbOFdpoHyWR8e9DXV9ci2/aYz5awNanbzUoI/W/hNDglZfIYgv+WkeGfn/NvNjoGj1yX64sZrxtFcpN6jjoUfMqBWg==</encrypted>]]>
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