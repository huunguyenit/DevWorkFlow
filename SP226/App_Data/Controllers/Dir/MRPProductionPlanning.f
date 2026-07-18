<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">

  <!ENTITY k0 "@ngay_ct = $ngay_ct.OldValue and @so_dh = $so_dh.OldValue and @ma_sp = $ma_sp.OldValue and @ma_kho = $ma_kho.OldValue">
  <!ENTITY k1 "ngay_ct = @ngay_ct and so_dh = @so_dh and ma_sp = @ma_sp and ma_kho = @ma_kho">
  <!ENTITY k2 "ngay_ct = $ngay_ct.OldValue and so_dh = $so_dh.OldValue and ma_sp = $ma_sp.OldValue and ma_kho = $ma_kho.OldValue">

  <!ENTITY BeforeUpdate "select @so_dh = space(datalength(@so_dh) - len(rtrim(@so_dh))) + rtrim(@so_dh)">
  <!ENTITY AfterUpdate "
declare @rate numeric(9, 2)
select @rate = he_so from dmqddvt where (ma_vt = @ma_sp or ma_vt = '*') and dvt = @dvt
select @rate = isnull(@rate, 1)
update @@table set he_so = @rate where &k1;

select @so_dh as so_dh
return">

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

<dir table="mctkhsx" code="ngay_ct, so_dh, so_lsx, ma_sp, ma_kho" order="ngay_ct, so_dh, so_lsx, ma_sp, ma_kho" xmlns="urn:schemas-fast-com:data-dir">
  <title v="kế hoạch sản xuất" e="Production Planning"></title>
  <fields>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" isPrimaryKey="true">
      <header v="Ngày" e="Date"></header>
    </field>
    <field name="so_dh" isPrimaryKey="true" align="right" dataFormatString="@upperCaseFormat" maxLength="-100">
      <header v="Số đơn hàng" e="Order No."></header>
      <items style="Mask"/>
    </field>
    <field name="so_lsx" isPrimaryKey="true" maxLength="-109" inactivate="true" filterSource="Vacant">
      <header v="" e=""></header>
    </field>
    <field name="ma_sp" isPrimaryKey="true" allowNulls="false" dataFormatString="@upperCaseFormat">
      <header v="Mã sản phẩm" e="Product"></header>
      <items style="AutoComplete" controller="Item" reference="ten_sp%l" key="status = '1' and loai_vt in ('41', '51', '61') and kieu_hd &lt;&gt; '0'" check="loai_vt in ('41', '51', '61') and kieu_hd &lt;&gt; '0'" information="ma_vt$dmvt.ten_vt%l"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZeXHZVmsI09j+/LNvnw2WcY1TDBA1fRmQt7Q1hvCzlCg5h41NK0s8j5ZeHBhRYHBre7QRE62fl/Lh/R+JdbqmAw=</encrypted>]]></clientScript>
    </field>
    <field name="ten_sp%l" readOnly="true" external="true" defaultValue="''" inactivate="true">
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
      <items style="AutoComplete" controller="UOMItem" reference="ten_dvt%l" key="ma_vt = '{$%c[ma_sp]}' or ma_vt ='*'" information="dvt$vdmvtqddvt.ten_dvt%l" normal="true"/>
    </field>
    <field name="ten_dvt%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="nhieu_dvt" type="Boolean" readOnly="true" external="true" defaultValue="cast(0 as bit)" hidden="true" filterSource="Vacant">
      <header v="" e=""></header>
    </field>
    <field name="status" dataFormatString="0, 1, 3, 4" clientDefault="0" align="right" allowNulls="false">
      <header v="Trạng thái" e="Status"></header>
      <footer v="0 - Lập kế hoạch, 1 - Duyệt, 2 - Chuyển, 3 - Hủy, 4 - Đóng" e="0 - No Action, 1 - Open, 2 - Done, 3 - Cancel, 4 - Close"></footer>
      <items style="Mask"/>
    </field>

    <field name="dv_yn" type="Boolean" external="true" defaultValue="cast(0 as bit)" hidden="true" readOnly="true" filterSource="Vacant">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 330"/>
      <item value="110-: [ngay_ct].Label, [ngay_ct]"/>
      <item value="110-: [so_dh].Label, [so_dh]"/>
      <item value="1101: [ma_sp].Label, [ma_sp], [ten_sp%l]"/>
      <item value="1101: [ma_kho].Label, [ma_kho], [ten_kho%l]"/>
      <item value="110-: [so_luong].Label, [so_luong]"/>
      <item value="1101: [dvt].Label, [dvt], [ten_dvt%l]"/>
      <item value="1110: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a6aEs9CDKG1l5LVMA32xHb3fo5H/YFkrmgBgukOI3tOLob5uRSrFiH5yM1+hGRDmcv3fnxar6G9VvoT0XHrDTQGTvKWEWN2+wq2QyQ44VVbvkmiOvc0BwekvsG99BMxFg==</encrypted>]]>&WhenBalanceBeforeEdit;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf3NRpUadENUhghGHTcGQ5B6ZBwzJ1Lv66umdAlaQgen0DUIH1YIiGLQUmw4HKnzV5Q==</encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a6aEs9CDKG1l5LVMA32xHb3fo5H/YFkrmgBgukOI3tOqfnwVd0w1j0WaGTrPD1XqGaQXQwhqaLA6EML+bPdXMBJiPM40rPDmtX0vXoV4QbUv1AhqoCtZrohWCfklQzQVg==</encrypted>]]>&WhenBalanceBeforeEdit;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf3NRpUadENUhghGHTcGQ5B6ZBwzJ1Lv66umdAlaQgen0DUIH1YIiGLQUmw4HKnzV5Q==</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf2K7Dj9/X/ZYwDDVhsN8eNqrglx3VTloYk9n9dvaIHMFW4GpslDJrcXi+FJNvayLQlbbCsC5kMjsS4yCIH9g4WJamuoDfR75tNYbEnjgyLBM</encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6cFl2Q5RK/TiOuAq3qbDNycwrzWSw/X+bhtIuqOyV9bL3nM+wwck/yxkKFEgqwDci6iA5PjshUkxG4hHhyI+aTN56/lf84TG9bq21B8UkmRa2a9qWYYRKTr2yWZv4+A9q0Rx+uML47uEHC80ay7yroPEM67eN4F/37P0ltVhzoL3/aFw6EoSjj7voP6l5t2gAiOIag7kBjcMaJJd+6k5JWhX3yYIxeKM05ateWqeW4Rw5H+z6r/XVSvn/qk/El6D4jmEFGj5CpO3mE/Us06OZXExmaCoeNShbTr0Wz75WfwgieRFRny2wtBhLw6l4dtbrw==</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%PqkM3HnrVADZFaHe07aaRRoTfovJA6/W+TOl2er7N+ZOBwl5a3lugcjxRPyErJf8VXykxtH36nPb7sMinyppJYy3y88I5WuuL1EWn5bZgzHxNjk/HEi1pKRn3uLCk/Xg7pYJVa2wjpSt+gs4EFCLyQUIpm9QoiHJSqkYImJfDrmAqAlVKRXaCVwJIPoodQuzaizQSckCxyBXBIoK09hJbYsDZHj8He4vBYYB4ZFKBaPfINHwMUSE3GetUQryPRAOrl8LSK+VPXkdKip2vDlYjqROr23agrAVVmz+LkMlR0ePuu8Yxld53Gd2kSyJjyaxZHtvBmf/zSxqbqZsI5Ra9sSIqgwGSqseNs0cGUi1WRVTZ0LgQJ0D0HIpc18aiPXI6Adf+PorwA4PEcAM8/OFMh2UjoB966aRdX0RqLqvdFsgiYA3M2cAhjB+FyAABqED1n8HQMqaONP1MPSmC2cAbni0QjbGe3UEljWva6paVshlNnVZfoYgcXZQI6uO12BD3Ab2bDJnmXRqSmQdhzoJspEgnQBfECcyTzfM7bnNnAc2QuSkbuaRuDKy16vqBrcuAH3M/1zOCLNcMcN6IcmqjOXO7fzaOYf/DrRT/Cm1ZG5J3CggDWOq/1bvlv2j2Qqm/qiHpaZwpt3uB/kieqxS8kHbB9KUFX2nqciUVRU+lGkl3d0cZCgLQ7awlg12NGFP9jiG8rxyugKwAvHxGts0jA==</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        &BeforeUpdate;
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK4vZG8geyQX0pJ1qS7bKa3chGulZx9js/QAMlXiOyoG+w==</encrypted>]]>&k1;<![CDATA[<encrypted>%cnASWSum4IkRBTbKLOi8cCSrQzZX8Fur9M1TK0M4A6PQ0vagfbRqJXXq9gSIAs6Wsg25pl5LK7GEpwDsVKC58v8ro4gBkQilbAI3pDJsvEnVcltk7jUdt5y8uy83SjkqZBDr/4haO2ttp1jh8XsZgEeo1UOkiQyue4FF1KtGeWgcDztPJi6dLEQUMHtOR9+eMl3Lj5jbU2JrDGR5zw7FC3zKXrOvMNSjh1Au7PM4SEvOZOPRc9hUHrO9hWeat4FOjckF+l6XzKHCajYZykj7/vyLburHL15zFCcareQ7fKs=</encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        &AfterUpdate;
      </text>
    </command>

    <command event="Updating">
      <text>
        &BeforeUpdate;
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf7698phDZMfyt4ALthXBAFtxs+lngbTzR/S55xp7+PxHkmo96UY2seq4mdHKO/VsQkjQ5MxFwGnLEQQ2fIQTL3BGyGsYFwPOL5UC8cmP+HxjXaWIzZF0ZJ4+Mrss5SXAs2fc1NQn2WL0UiEl56d6QweQwOoFTU0CJxlcs8V7hSFMRj6xcyzWlfL78w31jGmi/w3JOeiO6zRN3eekiuYuZgo=</encrypted>]]>&k2;<![CDATA[<encrypted>%cnASWSum4IkRBTbKLOi8cCSrQzZX8Fur9M1TK0M4A6PQ0vagfbRqJXXq9gSIAs6WF4hcBYSUEVu9tRDtOYMtOCNHXuNbP3CLkPB3nIx8B7vhODxL/yuLQQMad2tRAXg5Dy5ZQ/gKk4TP9F6aG1O3+5GVcBFa4Md1vKfnkhn92WuNLo4BJ5mnBmIBbl2BcLFZ8A9IBsWXxzVFYH+8nCqK4t4+iWPpDyz1N334PXTRlRsuIfC0iZOKoUyZB/lWIs3Wo+jbfyUzjwFDYd3e9G9kgQlKh8nna1kRrhU0s7h3/3M=</encrypted>]]>&k0;<![CDATA[<encrypted>%cnASWSum4IkRBTbKLOi8cE/hpETWHna8gLwEu3sbtN4/gTNFFQu0uenpQvEOpfKo64C+/GJR6A+stLGmvWCenQWjmiZXH5Ms/sggehN2p6w=</encrypted>]]>&k2;<![CDATA[<encrypted>%ShDm4LooPFnWfxWGAKIehxn5IEU5hwC3K054s/5gYTI=</encrypted>]]>&k1;<![CDATA[<encrypted>%ynJ3B2IMttZ3swIzstMMYTCWrnPrAusJM+ctaAr1M53tmdoDX+geZXNnt30E4xHNuQGIqRn6fqtc0OC90H2jYU+Qo0BLGVrsYJA11DxwI09ao9JnzMkmdOPILIQZiUcCAK5CKUMIOoY1+qxLv5Zwrp6fS8n91X7Y/URaJixQJFbd8ePVjuGi7bwMBTIvGt/0plXsqE2F+FaHQkiBwK3m3xo39NWNoCD3XJrQUi8mfio=</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbeqMboCxcWZPqmgVHI4rxdBdE5v2XLyIc5gSWiGIG4xro</encrypted>]]>&k1;<![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70FZ7Du3m7Rny2+OPmYoEles=</encrypted>]]>&AfterUpdate;
      </text>
    </command>

    <command event="Deleting">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a6aEs9CDKG1l5LVMA32xHbRlm35iB6NXDlnsXzsD2LVMn5Vr0FCXCq1N+zGzi/YldXhYNp1I3kUb3Afh4dG69BtmrbuFpM17ZQZ6PU6//m5G8mqFAA7FldAGZa/51F3utWJ995WsFd27gMft2dLWWG8ItCnqd2zoGuSpWVECMXtuHfy0CKzllxo/beRCoCb7lqEYGMY7JWNqDETpFgEkCTJwdRx6o8tC5VtrAIYN8b4+RJB+wUlKZ479Zet35zt9uZt3IVleHJj9VRDSasZVmNc7a72PzbEroRbDYYELMlZzMy7nlKBB2TGuIHxeQs2ig==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70O0wy9SVvmau+gtMzpgUrhfsUY3jr7NVJSqnnnwscF01tCS0XsZ8aX8DZ+SXw4W8CZvKpNusGpjZeSDSRfrgfjal7I3TxZS0BW4RDUGQitTrg/o4eUnTa1hHTATJYYnK4bwyCBP8EpgcokJDGHZAbF/6h96itpxvxKMx95kl5aFFddYt0LCfg2sCzIlOf0veyco8q2LCn+jQOjs8YI6ouuy919uTNDfjTa2F6Fl+5g/c4jsMGuEp4WiqA3oLs3wjwnzGXUL2e+HRE3JebKN/a3faGqxNlmVnJ4tvpzYY5OQxsJ1u/pTPlrADv5Bk4VcDpLw/6izd+F7J5bKHYxljrz+xcj2NvtMr5N2/rQeI0/ldJN2TdNt4vQjrkdvj/mTr7OikF7VA6Eq3IOa35Q3yCsylBEWzPhNWhrOahp8ZRmpW1py4c04vGRzR+5A5fmkgNyUpp+DVZA03pTVkIGtg9fcJ21kOwKiUVgNaulpRcyx2dh3GA5iD3lpQ2H1V2e+kWxSY6LtJP1m1RDdmUkQB5shIN6Paa5EHeq5jQCEu0GwwzfspM8Gd7F+5DUlfxrSI0Rj1UmPf4AOcdgrB9fm7mKXw5fZD88YqqfvGdLlCB6b3oKQAn5qGFRtf4D3zgYKSXw2yc6QS48JgdBC3/O72L4f9KmA2PfB7IPCaA7LTeqwhZa+FabidXvq3axrPBstNFTFNc91ZRr/GnS4NQ5sejkzIl47DeeBNSse49cxekVX3icpGbQpNLAQQ8WnP5IYdvdE8qztP46Ib0nRY9eK/TWIIdD2vAtnL63OTrl+LM4Jay6U4+BLYKGuZ4nmC8akyZyLuCFF5j9KnjH9J594hntMJ5wZmMbS83yEBEYff3HGSJx7mzJWNm4favcJkp++uZh5kxe2pnkYQc+a/bzFGVio=</encrypted>]]>
      &ScriptIrregular;
    </text>

  </script>

  <response>
    <action id="Item">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK6+INkQWNmjEwlPl+HrVfmFBnjgNDyIZG0TPzJ1tTYVmXD5wVXsAPrJf89uCXH2KWVzkA9wBu9QYD3zQdMjQdQzq/ICcL6arZJntjPsM66jTnmna49pdp2h6ikA1N9eMvhn7lkAv5SbyqWikpIOREpg9VqEC0CfESfkIen2W+5NrA==</encrypted>]]>
      </text>
    </action>
  </response>
</dir>