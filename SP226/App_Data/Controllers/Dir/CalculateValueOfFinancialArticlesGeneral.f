<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir[
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
  <!ENTITY CheckIrregular SYSTEM "..\Include\XML\CheckIrregular.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY AfterUpdate "exec FastBusiness$Report$UpdateReportForm @@table, @form">
  <!ENTITY Check "
if (@cach_tinh &lt;&gt; '') begin
  create table #t(b bit)
  insert into #t(b) exec FastBusiness$Report$CheckReportForm @@action, @@table, @form, @ma_so, @cach_tinh
  if exists(select 1 from #t where b = 0) begin
    select 'cach_tinh' as field, replace(@$updateConflict, char(37) + 's', rtrim(@cach_tinh)) as message
    drop table #t
	  return
  end
  drop table #t
end    
">
]>
<dir table="gltcptct1" code="form, stt, ma_so" order="form, stt, ma_so" xmlns="urn:schemas-fast-com:data-dir">
  <title v="chỉ tiêu tính giá trị tài chính tổng hợp" e="Calculate Value of General Financial Articles"></title>
  <fields>
    <field name="form" isPrimaryKey="true" disabled="true" hidden="true" readOnly="true" defaultValue="Default" clientDefault="''">
      <header v="Mã số" e="Code"></header>
      <footer v="&lt;div class=&quot;Break&quot;/&gt;" e="&lt;div class=&quot;Break&quot;/&gt;"></footer>
    </field>
    <field name="stt" isPrimaryKey="true" allowNulls="false" type="Decimal" dataFormatString="###0" clientDefault="Default">
      <header v="Stt" e=" Number"></header>
      <items style="Numeric">
      </items>
    </field>
    <field name="ma_so" isPrimaryKey="true" dataFormatString="X" allowNulls="false" clientDefault="Default">
      <header v="Mã số" e="Code"></header>
      <footer v="Mã số/Mã tra cứu" e="Code/Lookup Code"></footer>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZZmITaxH9adf+tLV3QSAKmlKb4ieTdQA9QN5id+oQ2pt</encrypted>]]></clientScript>
      <items style="Mask" />
    </field>
    <field name="chi_tieu" allowNulls="false" clientDefault="Default">
      <header v="Chỉ tiêu" e="Norm "></header>
    </field>
    <field name="chi_tieu2" clientDefault="Default">
      <header v="Chỉ tiêu khác" e="Other Norm"></header>
    </field>
    <field name="ma_so2" dataFormatString="X">
      <header v="Mã tra cứu" e="Lookup ID"></header>
      <items style="Mask" />
    </field>
    <field name="kind" dataFormatString="0, 1, 2, 9" align="right" allowContain="true" clientDefault="Default" defaultValue="0">
      <header v="Cách tính" e="Calculating Way"></header>
      <footer v="0 - Tính theo mã số, 1 - Tính theo số dư, 2 - Theo số phát sinh, 9 - Tự nhập" e="0 - By Formula, 1 - By Account Balance, 2 - By Arising, 9 - Manually Input"></footer>
      <items style="Mask" />
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZZ9iGvkuZfOSC63RSIQIBxTR3t/iXZ73FJycUSKcWznEZEX0Rbm/NwtfBclqOkuXDw==</encrypted>]]></clientScript>
    </field>
    <field name="tinh_chat" dataFormatString="1, 2" align="right" allowContain="true" clientDefault="Default" defaultValue="1">
      <header v="Tính chất" e="Type"></header>
      <footer v="1 - Số dư, 2 - Phát sinh" e="1 - Balance 2 - Arsing"></footer>
      <items style="Mask" />
    </field>
    <field name="ct_dvcs" dataFormatString="0, 1" align="right" allowContain="true" clientDefault="Default" defaultValue="0">
      <header v="Chi tiết theo đvcs" e="Detailed by Unit"></header>
      <footer v="1 - Có, 0 - Không" e="1 - Yes, 0 - No"></footer>
      <items style="Mask" />
    </field>
    <field name="no_co" dataFormatString="1, 2" align="right" allowContain="true" clientDefault="Default" defaultValue="1">
      <header v="Nợ/có" e="Debit/Credit"></header>
      <footer v="1 - Nợ, 2 - Có" e="1 - Debit, 2 - Credit"></footer>
      <items style="Mask" />
    </field>
    <field name="cong_tru" dataFormatString="1, 2" align="right" allowContain="true" clientDefault="Default" defaultValue="1">
      <header v="Cộng/Trừ" e="Add/Subtract"></header>
      <footer v="1 - Cộng, 2 - Trừ" e="1 - Add, 2 - Subtract"></footer>
      <items style="Mask" />
    </field>
    <field name="khong_am" dataFormatString="0, 1" clientDefault="Default" defaultValue="0" align="right">
      <header v="Kiểu" e="Mode"></header>
      <footer v="1 - Lấy giá trị không âm, 0 - Không" e="1 - When Value is at Least 0, 0 - No"></footer>
      <items style="Mask" />
    </field>
    <field name="tk">
      <header v="Tài khoản" e="Accounts"></header>
    </field>
    <field name="tk_du">
      <header v="Tài khoản đối ứng" e="Reference Accounts"></header>
    </field>
    <field name="tk_0_gt">
      <header v="Tk không tính giảm trừ" e="Non-deduction Accts."></header>
    </field>
    <field name="ds_ma_dvcs">
      <header v="Danh sách đvcs" e="Unit List" ></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ds_ma_kh">
      <header v="Danh sách mã khách" e="Customer List" ></header>
      <items style="Lookup" controller="Customer" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="cong_no" dataFormatString="0, 1" clientDefault="Default" defaultValue="0" align="right">
      <header v="Loại" e="Type"></header>
      <footer v="1 - Lấy chi tiết một vế của các đối tượng công nợ, 0 - Không" e="1 - AR/AP Items, 0 - No"></footer>
      <items style="Mask" />
    </field>
    <field name="cach_tinh" clientDefault="Default" dataFormatString="X">
      <header v="Công thức" e="Formula"></header>
      <items style="Mask" />
    </field>
  </fields>
  <views>
    <view id="Dir" height="132">
      <item value="50, 20, 50, 40, 40, 20, 60, 30, 40, 70, 130" />
      <item value="10011------: [stt].Label, [stt], [form]" />
      <item value="1001010----: [ma_so].Description, [ma_so], [ma_so2]" />
      <item value="10010000000: [chi_tieu].Label, [chi_tieu]" />
      <item value="10010000000: [chi_tieu2].Label, [chi_tieu2]" />
      <item value="10000000000: [form].Description" />
      <item value="10011000000: [kind].Label, [kind], [kind].Description" />
      <item value="10011000000: [tinh_chat].Label, [tinh_chat], [tinh_chat].Description" />
      <item value="10011000000: [ct_dvcs].Label, [ct_dvcs], [ct_dvcs].Description" />
      <item value="10011000000: [no_co].Label, [no_co], [no_co].Description" />
      <item value="10011000000: [cong_tru].Label, [cong_tru], [cong_tru].Description" />
      <item value="10011000000: [khong_am].Label, [khong_am], [khong_am].Description" />
      <item value="10000000000: [form].Description" />
      <item value="10010000000: [tk].Label, [tk]" />
      <item value="10010000000: [tk_du].Label, [tk_du]" />
      <item value="10010000000: [tk_0_gt].Label, [tk_0_gt]" />
      <item value="1001000000-: [ds_ma_dvcs].Label, [ds_ma_dvcs]" />
      <item value="1001000000-: [ds_ma_kh].Label, [ds_ma_kh]" />
      <item value="-1011000000: [cong_no].Label, [cong_no], [cong_no].Description" />
      <item value="-1010000000: [cach_tinh].Label, [cach_tinh]" />
    </view>
  </views>
  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf2+j97jlg+7FdtYzEuVP0WZTIHaGILeeju/2xMo9QgLt8ESIr0B4+FKRIhjXClngYeHAlOfCpQTiUuPyh8SrPGc=</encrypted>]]>
      </text>
    </command>
    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf2+j97jlg+7FdtYzEuVP0WZTIHaGILeeju/2xMo9QgLt3jdNnFccosMebh5UJ/aS8yQCsUwdzqQb1HYFBunjJk4=</encrypted>]]>
      </text>
    </command>
    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbTihtmGQDHec8XcoCrOAY8DFQdm3rK5K8JpimLnRaFlYRR2SOu98hJJnZP4GpFO+XmGC9qjDodou4wVI7EsK1e1g0KiHnB1Kh1oCmQrNCxo8NSbJuy7vb6oD6j+pKl/daHeJgPfZWmP3fcIyMOSaTfxHH/SvJl+Q3NsubmGDlEOnNVGy8jElfKm3hjmBO5LIamWcLDgTklDDfuC1brTqxAB++Pq8x4i4duXLzB+Z5hKTN8NrkRUSpfMp3xwWI5nfYsytFnWJl0a/OM4EJOXTaPPYuauVJMTDmuOCLT/UQg0RKNCvJlUD/0kBuTvnnwe+9gHyRydT3b6NjOhJXiRkIuJ</encrypted>]]>
      </text>
    </command>
    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82nRHrYNs2hPfrO8rS7fOlZg+/BsYflDsdLh177bfLlZW++0qVdY+0yxoQxsWo4rCnZ0wNzRx2cIedJcC85dM823Mda+t/0F6cv5d88yet+IRkFInW4IxAFV7mVjoHuGHgg</encrypted>]]>&Check;
      </text>
    </command>
    <command event="Inserted">
      <text>
        &AfterUpdate;<![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ohEXCLssrEWI7NO2TCIoWqokdwb+AaWF26CS10RZzk8HIRAfwhL9Uz28USLmpoGMT+N9Aq9YgQT0xj6en6UJ6W7DN1Gu9MkIS323SwGtJUXWyo7XhWCO/LSRa9GcH5T9V0=</encrypted>]]>
      </text>
    </command>
    <command event="Updating">
      <text>&Check;</text>
    </command>
    <command event="Updated">
      <text>
        &AfterUpdate;<![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ohEXCLssrEWI7NO2TCIoWqokdwb+AaWF26CS10RZzk8HIRAfwhL9Uz28USLmpoGMT+N9Aq9YgQT0xj6en6UJ6W7DN1Gu9MkIS323SwGtJUXWyo7XhWCO/LSRa9GcH5T9V0=</encrypted>]]>
      </text>
    </command>
    <command event="Deleting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK4vZG8geyQX0pJ1qS7bKa3cD5bBAJPoljwGk5C9G+UAKMnJeWPj7m4eQ73U7Ly0N/4OzDhOtpMlP2MVMdz8yp2h+6+XqhzeIcoR400TBCwqw1b1XDz/g+3shUndhBK690fs0Emtovttpyg31IcS4wXGanMWL+apUXqzkg8ciW5WdeDVly0QxoCPN0i94ke5ueSixjxFibUs00EWmHujnn5wUgmg/6/Uftz17USbCZGEJaeOScCMVmfY/Tua6FMl60FB0Is/xXgJtN5l/D6//NdJzxbD5psMtO9L9cFAk61YJjKEyaxPZX2XHgLSQ8G+ii9pZ8OhcNGsU9lfg+AcleOAKinxnMvn4RRjP13IM+jiTbxPYHqFhE4AzSr2/d6tAWthhdCMx+eY7Ij3BiITSateh0Qdqxk7vHKYGU51y9cru5MAopH7GsUiKFa+mKEDwpw=</encrypted>]]>
      </text>
    </command>&CheckIrregular;
  </commands>
  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70FW11TMx9O4os12meFBJAmSA2TxR0pvSxpF34G6u3rDUNDHJv9V3JUmFk33tas+vX21VY2iTH5C+X3KXfwx+5tdhNid2x9qB7sz2cXQTIv929XlsMnuyWXu+N4+0GvmlkBbc2LwifEhhVrYA4QW0/rTLW03272r2hi+eLH/B4J65o9CpbQTXksbKe+YtvLSeKBxYjKDBbdSn9DA/xRy/zhYPrg+7t/xemwmVdFs7J5Zbk3av3u7QCNNzrq23QzoNBL44DD8jtPqWBJayKWuPQF/RU0FcDu+M25MGGCQarDX+T603ZXfGdPI4JdtqnflDVItP/BBuoghURQnHJO9MxDbWrsZ+2ksoR5gRhAUzwOdFuNHstEe83RBLm+3vQoe44rqQBK+wDHIGbRRHuICh4BZ9HcethzQw75AP0FDAEjzbuPckvwOsFZIQEQYHBCm2Ya408qUtTyy53a360UrrdDUktws0eFwBj5/xJ3qw1b5Z0F7RD12fCIwep3inO9VVKawSFvEcbnqHaBoaxSe0SmAhQA100de7PkerKbvSqHTa8TgiuA8xUgzGt+wEDIaIzrVQpFtBqN5ab4FXIPHsThYptlYwPlL6AEWwPKyP8+fr+e2U0A3z4PyJ7Jl05B4B3rrzmdja16465S23J3EjiicDjaPTJvFu7+Br5nuVjXLs+E/5h4Pc8C64F9+BdjgeNNG7INSXLJK2FieYYzmPI0ZsneCbFVqcEXuTj5QoKSMG7bFuIQS/vntTdvbY50rBdl3YSzpExjlMolr6VzPg7hp2rQ5ZiuxLplYHoDHQjh4w0K45ZelAm7vPnCZzozonfGw6Lb1QcGQmrwzwqcg20uP2mQ8T8JgXKHaU0kxTZ/X7Uq8/3e6hIrSNIHu4E8WZNnqF1HECs43xP29iO57cBgCPFSDHcgDZb/qMtxkfGy4JlX+TVM/J4FZKBWNXuZsPWMFQsnsICM4bZcdFJPPc+kRmte8C+Pd1iS812xdao8bd6k0KYzNy5sTfhgpY2kKlygO+ZpqvVw+2ODIwtR6sTt+2YwrMyIcaAB6xa1u2vg7+ZlEWL31NSLO0QMqH+o22EICMXpHjlE4NSbBj1nOr7MobV8e7R44Rk1hwvg1VtzgeXqpmbqKCY6tgL0sFyerLospYmJQHi/ZkgnFrUCN9ijg=</encrypted>]]>&ScriptIrregular;
    </text>
  </script>
  <css>
    <text>
      <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6bRVyGVSO6Z9ow9FLIFYSz1DyNnoPLt5+FiEUX/ktBzxQILRaEmFEfMWjXDh1nHEs9l5bnXvrrl/KkCUqbqiupkDLMjNVYlF76ahXBBnZXvadTOl15IzDDjj1EStxt9hIZandPbNy+IgSUAP0FRxf8K2BPbwKid3SeOz/dPFm8F5EmoK51+oL4SALxwNfONGAL8UcO4OuXwXQs5ipVDyORs=</encrypted>]]>
    </text>
  </css>
</dir>