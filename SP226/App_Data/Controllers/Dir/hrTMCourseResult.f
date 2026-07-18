<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenVoucherNavigating SYSTEM "..\Include\XML\WhenVoucherNavigating.xml">
  <!ENTITY XMLWhenVoucherCopying SYSTEM "..\Include\XML\WhenVoucherCopying.xml">
  <!ENTITY XMLWhenVoucherClosing SYSTEM "..\Include\XML\WhenVoucherClosing.xml">
  <!ENTITY XMLGetVoucherNumber SYSTEM "..\Include\XML\GetVoucherNumber.xml">
  <!ENTITY CommandWhenVoucherBeforeEdit SYSTEM "..\Include\Command\WhenVoucherBeforeEdit.txt">
  <!ENTITY CommandWhenVoucherBeforeDelete SYSTEM "..\Include\Command\WhenVoucherBeforeDelete.txt">
  <!ENTITY CommandRecordHasBeenChanged SYSTEM "..\Include\Command\RecordHasBeenChanged.txt">
  <!ENTITY CommandCheckVoucherNumber SYSTEM "..\Include\Command\CheckVoucherNumber.txt">
  <!ENTITY CommandGetIdentityNumber SYSTEM "..\Include\Command\GetIdentityNumber.txt">
  <!ENTITY CommandGetVoucherNumber SYSTEM "..\Include\Command\GetVoucherNumber.txt">
  <!ENTITY CommandSetVoucherNumber SYSTEM "..\Include\Command\SetVoucherNumber.txt">
  <!ENTITY ScriptVoucherNumber SYSTEM "..\Include\Javascript\VoucherNumber.txt">
  <!ENTITY VoucherNumberLoading SYSTEM "..\Include\Javascript\WhenVoucherNumberLoading.txt">
  <!ENTITY VoucherNumberScattering SYSTEM "..\Include\Javascript\WhenVoucherNumberScattering.txt">
  <!ENTITY VoucherNumberReading SYSTEM "..\Include\Javascript\WhenVoucherNumberReading.txt">
  <!ENTITY ScriptQueryData SYSTEM "..\Include\Javascript\QueryData.txt">

  
  <!ENTITY AfterUpdate "FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssQjHT2vn2xmreKKewvv2380sIvHbnGgnhg/s/TVRF+1GJSz5op8MU0VuszzDJwE6+A8LO92fwgfAW8TSp/dacnFshhsKrum4GLvfwDhkdeYpcPGiCpQ/bbdQ5YqpomdPErehdvns/FhYEezqc5RAiiHidDs4KsiJQf2tW4GR7mlnJ5sNQL1Mac2/t4PHSgTbMc=FastBusiness.Encryption.End">
  <!ENTITY Declare "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu3OMiBxVZqw47pzWVz9Kdys+iaMgxPTwfkmoratvys+lvX9lsNoaz/9+HsAd2H5/p07XMnxRFVvoL/n6FZFu9Mjvxmb3ANpQoSEx7vG3DzxPFastBusiness.Encryption.End">
  <!ENTITY Delete "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMuzbXvmgQ0EE+nrRe4FqVL6VhZ1ewdfYsOMs+7Rq3zvikit1X1DyQ41Y8QBtvPTc+VI/YUjPuWhIxsYajz8SdsnM=FastBusiness.Encryption.End">
  <!ENTITY Post "FastBusiness.Encryption.Begin$JFAg3c674j2f8bRB56rmcHy2EV02P8Q2R7ebLwocGF6hTuUX/PoTPfqQAdE7wEmwxunnXvTU5h9gQojuw8MYuZYt6vyk/9p4+5N0HlGJY+/6hl2tpWYvMb1yRmsL+SKa13o5UMcccoUFEKaHUAeHBWbOcg0j+taDWegtdFI/23868N5Cgz/uOtAqTjbJjNcMjy9gddGS0c79ecUvmcMsnBSRNlQM6h5+7KK1lE++ZMYgUIQVuLWSTknIXhPFL5bmmxsJY6xRt7DFqq5OsPW2ffWwqy0gUsw9CjTX2JpEQwiz29EoNJtgQuwqeV/JD/kXgrYeEHcxTwBGjhMpc8/M6VRwr/K8CxnoksGkPcyzSDGYveEn+O7BSj6/3UtnN+KcS0hksp8yhyF7lNYs0nVXk8uCEuwO7Y1ZPAeEjmMQ+dcAziITpglpGFM0BtaPPL2z1OzHQny9C3Ta8kaYD4kBPsXVYrbrEfcJC0C7SLXKIEoyltyHMInzboM93IaoE+8zYcBOkbd74wpqRkUc9AydzeKc31yXKhfLym3KQmkoJ76CGDITv+aLu7oYb2YRTwV9VppRg66hI1KzJnSU2uJHLS4hiW3OfCyb8driDjeVwBqTjWn0saKeWQDZTZi5a9BqFastBusiness.Encryption.End">
  

  <!ENTITY % VoucherEditLog SYSTEM "..\Include\VoucherEditLog.ent">
  %VoucherEditLog;

  <!ENTITY % Extender SYSTEM "..\Include\Extender.ent">
  %Extender;
  %Extender.Include.hrTMCourseResult;
  %Extender.Ignore;
]>

<dir table="hrdtkq" code="stt_rec" order="ma_dvcs, ma_khoa" id="H09" type="Voucher" uniKey="true" replication="1" navigation="true" name="cookie" check="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="kết quả khóa học" e="Training Course Result"></title>
  <partition table="hrdtkq" prime="hrdtkq" inquiry="hridtkq" field="ngay_ct" expression="''" increase="{0}" default=""/>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_khoa" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã khóa học" e="Course Code"></header>
      <items style="AutoComplete" controller="hrTMCourseInformation" reference="ten_khoa%l" key="(ma_khoa = '{$%c[t_khoa]}' and status = '3') or (status = '2')" check="(ma_khoa = '{$%c[t_khoa]}' and status = '3') or (status = '2')" information="ma_khoa$hrdtkh.ten_khoa%l"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb68mB6AfZxcsoqJmXHp5sNeTtgzvHF0F6Tn8wnqZsCpIO+9DimPNx86OWUJHnr8hD0=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_khoa%l" external="true" defaultValue="''" readOnly="true">
      <header v="Tên khóa học" e="Course Name"></header>
    </field>
    <field name="ma_mh" external="true" defaultValue="''" inactivate="true">
      <header v="Môn học" e="Subject"></header>
      <items style="AutoComplete" controller="hrTMSubjectList" reference="ten_mh%l" key="status='1'" check="1=1" information="ma_mh$hrdmmh.ten_mh%l"/>
    </field>
    <field name="ten_mh%l" external="true" defaultValue="''" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvdt" external="true" defaultValue="''" inactivate="true">
      <header v="Đơn vị đào tạo" e="Training Provider"></header>
      <items style="AutoComplete" controller="hrTMProvider" reference="ten_dvdt%l" key="status='1'" check="1=1" information="ma_dvdt$hrdmdvdt.ten_dvdt%l"/>
    </field>
    <field name="ten_dvdt%l" external="true" defaultValue="''" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ngay_hoc1" type="DateTime" external="true" defaultValue="null" dataFormatString="@datetimeFormat" align="left" inactivate="true">
      <header v="Thời gian từ" e="Training Date from"></header>
      <footer v="Thời gian từ/đến" e="Training from/to"/>
    </field>
    <field name="ngay_hoc2" type="DateTime" external="true" defaultValue="null" dataFormatString="@datetimeFormat" align="left" inactivate="true">
      <header v="Thời gian đến" e="Training Date to"></header>
    </field>
    <field name="loai_hinh_dt" external="true" defaultValue="''" inactivate="true">
      <header v="Loại hình đào tạo" e="Training Type"></header>
      <items style="AutoComplete" controller="hrTMTypeList" reference="ten_loai%l" key="status='1'" check="1=1" information="ma_loai$hrdmlhdt.ten_loai%l"/>
    </field>
    <field name="ten_loai%l" external="true" defaultValue="''" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày lập" e="Create Date"></header>
    </field>
    <field name="status" hidden="true" readOnly="true" inactivate="true" clientDefault="1">
      <header v="" e=""></header>
    </field>

    <field name="d09" allowNulls="false" external="true" clientDefault="0" defaultValue="0" rows="235" filterSource="Tidy" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="hrTMCourseResultDetail" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    <field name="dien_giai">
      <header v="Ghi chú" e="Note"></header>
    </field>

    &ListField;
    &PostField;

    <field name="ma_dvcs" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="cookie" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="t_khoa" external="true" hidden="true" readOnly="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec_kh" external="true" hidden="true" readOnly="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ngay_ct_kh" type="DateTime" dataFormatString="@datetimeFormat" external="true" hidden="true" readOnly="true" defaultValue="null">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="295" anchor="4" split="6">
      <item value="100, 100, 100, 137, 100, 8, 58, 42, 8, 100, 0, 0"/>
      <item value="11100010-111: [ma_khoa].Label, [ma_khoa], [ten_khoa%l], [ngay_ct].Label, [ngay_ct], [stt_rec], [t_khoa]"/>
      <item value="111000----11: [ma_mh].Label, [ma_mh], [ten_mh%l], [status], [ma_dvcs]"/>
      <item value="111000: [ma_dvdt].Label, [ma_dvdt], [ten_dvdt%l]"/>
      <item value="111000----11: [loai_hinh_dt].Label, [loai_hinh_dt], [ten_loai%l], [cookie], [stt_rec_kh]"/>
      <item value="111--------1: [ngay_hoc1].Description, [ngay_hoc1], [ngay_hoc2], [ngay_ct_kh]"/>
      <item value="110000: [dien_giai].Label, [dien_giai]"/>

      <item value="1: [d09]"/>

      &ListView;
      &PostView;

      <categories>
        <category index="1" columns="769" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>

        &ListCategory;
        &PostCategory;

      </categories>
    </view>

  </views>

  <commands>
    &ListShowing;

    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvl04AQbI7kzeDkVHKYYxt6iBTGyQj+DNp4QBhsmmGp/yeGjTnHySD64CBWT1K3Bzc2/e+BxSiz7FWoc1UbLyf51</Encrypted>]]>
        &CommandWhenVoucherBeforeEdit;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHKix8BWItqUg2G+17EWtfwMvAahnyAkjUTnVOlamN5QDCjWziQ3ZZE5Xe8JMjFLhg==</Encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        &CommandGetVoucherNumber;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvl04AQbI7kzeDkVHKYYxt6i5GpFKK2NkFdGqEKQYtAbK+irh+ZjWU6VpV70KjFISPs5Ww4qUAlt49wuKV3YIKsc</Encrypted>]]>
        &CommandWhenVoucherBeforeEdit;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHKix8BWItqUg2G+17EWtfwMvAahnyAkjUTnVOlamN5QDCjWziQ3ZZE5Xe8JMjFLhg==</Encrypted>]]>
      </text>
    </command>

    &XMLWhenVoucherNavigating;

    <command event="InitExternalFields">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuyaVpCbdGljJ0ivNhQve8w8wXVOF58IKhu2WJK1InR6WuRM/3NYS+um23wJHsupUnBb27Kx9fQ0cHYDvNjk1kZ+QGxLhP/GPEQXL9tkUERJ9s4znaNHElQ1ZadCGN5KI69GV7s67n7Y9+BFVBbFt6qf9bKnXVZvnQz9YNkSnxZq5sXkQJAVxHyjV7qksvZoujhIoRuiCHOwRqnMoHxp5S/DmO2vRGsuBEsEu56Yeyo1kf5Aoc4QSg4hfOswD1hHDz8n8GgSonc0GBQr1W+58dLAN8/wRYR/wfnqBqJ+WqC9EORjF4b9EOYiPP80gH6aQpnNLq5c7saYyMT2ZzLRxgIdTjyFmxkK1FN6++iTJynr1zDu2bO7VyIWJnbOKYgDnyHBRYnOOid/8Q5HgHgiRMxuFe/LY6K48uyixrZU9EPBouYfJUkUCG3xGuhKVVD7uInwIyOz6iW/i4WETUjyRC40=</Encrypted>]]>
      </text>
    </command>

    &XMLWhenVoucherCopying;
    &XMLWhenVoucherClosing;

    <command event="Declare">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz/Y5C4Hib64R6fQZYNBXq2GXVEW4+Qr3bPaP2H2ciTj77TVegm5mUz62UvScek8mbeL7y7s+/DrPZW7aF6QKY7XDKWGKTnXRvVrGHH58uV6wFdHrgKmRdWPGBArrl6GILFixgpoaS4BZNRUYMSyLdQZ7pecQ/GXhYdnZCk0NMxoLl/PEUKCZPYqs/fJnRVAWWwMMCUFt3Eyrc04Z222Rc0DNpSb82UjdvciB0vF64I3h8imv2uQ+6PbpLOOCJXdObW2cBCVEskQtE/BQAGRY7JH3NRvOR8YHR9XpOS6Ue2K</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        &CommandGetIdentityNumber;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcMLD5X3CxYsVxnCkXoptd50biKC48OsUlyBAM6lLXsSxZQHWt42nmasuvA8Ha5cIdasa8DZLVvM7P3z9wS24Asn/Ypws1Q+oxxtBWrrAkv9tKI+9BoneajMvvAb9BNXI6LcmnrX/uwHQLwdU1EnuT9PZEdbao9nRjN0/fpeIAsrP5xgOVmZf/z6aAVlFyNBp+qABdfB2qz0bYgSJFExt7P95C/jklcWUe4UcD/jwfdQECh2EPJa+XBxgYrAfCp3hAXbD8v5fuzUZ8im/p7LZG7MuSVuT+SdlwSDwZ/oOZAlwYAW17A3K+LRqOTRG5AEa9g==</Encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcGL9FBiPNG40eUwIWlr73VZ4Bvw8mBcESZEx3q7vx/pVsKrvAU59Cdd/g+R2anUP0g==</Encrypted>]]>
        &AfterUpdate;
        &Post;
        &ListDeclare;
        &ListCommand;
        &PostInserted;
        &ListQuery;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ05bww1DwCx6t1rrcU3se34JmodDlEVwoSSM8lPeIilp5rykxi1xP8tCTX0t8Ctu4cOsjPaH2SZ/u+e+TIYb8Dac=</Encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        &CommandRecordHasBeenChanged;
        &Declare;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm6mTJiZpuAYAKBwWtI8N/7Yt5pHVo2GR1otQbmvfzIgmuyrI3t9x1h/7MW4iUEWLtmWI6ol77F/lIqdodw0WBb6zW+Ndudsm99MJ4Wapz9pNnOaNfAsUVc2Nqph55ht3HelkOoGotY2ek7Xl3PmHD0kkqBjJq9bmjNGGwQbtRPxk0Ct9qqmnElWOHc0RTgo670u33I9HXX5fdmNx9ZqiJj2</Encrypted>]]>&VoucherWhenBeforeUpdateLog;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Yum7WXlBJcJbnCrwfSnby4jQbAMD5HrP6g2LFMyaoeOBGsAX0Ky8Z1DSgOlVixS53RZ5bNukzIPhpYPTJAqfyN8YV4y59nCxc5RjLNzoqkVqOcNLIq6MyolHvrpXzNVC85Z/Yag9kFKi+J8TWH5Ec0=</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Yum7WXlBJcJbnCrwfSnby5vuU8ZmKT/ejvufSjX3zaTZ/o06QTLDhIvg6uDGbhDvtqDkRdGbweMtC515tunEbdTD5oqdB7sM9nRtoCU7xV2Z2hVsFU0meFhkTBK/pCd8wqgNLI3kR2/WYpz5IyDhpwNE4ongS8I629yRgS6QAyF60cKRgFwjjP/5uRRSEK055ND3Tdg+gwZ1osciBlSZEF/FrX3HBJI1fwoNSuUd6GUewFJaJ0j/CvrgDeBlHqdF9QJWjqr04wjRY4598F9hkvW/LD/usHR3XK1AdXqyNww</Encrypted>]]>
        &AfterUpdate;
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Yum7WXlBJcJbnCrwfSnby5vuU8ZmKT/ejvufSjX3zaTE9G/5e3Q7Dh1TFQunHz1IQ==</Encrypted>]]>&Delete;&Post;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22dSsrA/ac74vbUYdAJ19DIuxiUlX183MeWGGzkHvuRak</Encrypted>]]>
        &ListDeclare;
        &ListCommand;
        &ListQuery;
      </text>
    </command>

    <command event="Deleting">
      <text>
        &CommandWhenVoucherBeforeDelete;
        &Declare;
        &Delete;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4W7+Lc585ygcKSWABV+z1diagbhbm327jG37VAlxQOD5y7yKPGb/bEsLOcOyzDRhEbaW/Q2cVHKX/a+/GXjwgeCLsa81DGPfIK2EbvdJlBN</Encrypted>]]>
      </text>
    </command>
    <command event="Deleted">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu5hiwQ4xteweFIsYiGz8HUldsI3ZBDMRcbrHyaPZZ+0gzKGajyIweosZ5RchAuFlHnY9ywhmW/EvjcTI79bedlA=</Encrypted>]]><![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuypxWhbJCJPtHgNnuGu1+0gPYQ8mxLDcjh2k4CN0ys190FEfoDa4tgRuh2KRTzskkX/QAcNa1vo62/CzWOESguo=</Encrypted>]]>&ListDeleted;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WNW5tM+6Sho8Vjns2OyPfA=</Encrypted>]]>&PostDeleted;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcIaF5R32Ll5k0Mj/ohn8QB5Mip4en6CM7nbzfGM/1nfl</Encrypted>]]>
      </text>
    </command>
    <command event ="Checking">
      <text>
        <![CDATA[<Encrypted>&irH/Guq+c+xo5Lumk85DTGVMFvZ4f3E68EM838mQnKzg1CnqAqiGaVcLrReGHQaYNtQoNZJIx9qTY1AEq/qh+Ub4+4xQ5rKY8SdwWG5kaDqb7sgu+gucwnr84xB3iW9aLBrc4vk7XZaPfBvuL1q95hYekY6vOe0w2Ya7ka5Eu8S6b4prAIRIEfmQZPAiTduOY4I6QsCVBFrrHiPM385C1BuubJqGhrRRcA4n508jn2jmPw4TwaWntXkldPFtqMB4gccB/Ed5r5GIQImrKovf9N5dRDpYyZEZRC59zO2ShVoRF4O4Eav6OYDTH7p3Jdb0Nwrxl9lrOWE2NWDuzeWWsq4laoUPqkbzmzd/0UxC9D1/tvhg9vGbz3Q7Ta2oY36bsW1Z0p+YzHZGlkahDhGIxu88Zb0i8eBi2vGXzG9T5hA/smv0gL1gy80xRz5VTFh4j2Av+mo6ZNEQjKWMi50hwNUxRfNpust9epaHbM66BLhnUqK1eA6jue1aswBR9Xs2f6ogK4R8oKrKZVu6nltkwdrLppuZXPWySzl6xB9ZqQ9bdvOBbpwnRKgnz2OrdDMxmO4+mOE4C1c5xagO8AiUabGgrbq7ebM3X7lq7OZwvAwViho064fvPZOSXQzI2+ozxFFj0lMlf01FjQ2eH9Ztz/eAs21ERHoNF//JZlnUii7wuyJWQFPhZhGr7olKbQWh</Encrypted>]]>
        &ListChecking;
        &PostChecking;
      </text>
    </command>

  </commands>

  <script>
    <text>
      &ScriptQueryData;
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22RUEW0slMShueWy06PcBDyeZAU5b6lMFpjSQkscZvpqfe7LNR7NoDx2kmyW2x9eGixSzTG4jANF0WdMxHYAfCBivcGJAK4WSTTzQitdyLv9hz8kOBVtsS803nd/act9+Vi9sKBB6M4cyYkxL4xY1rcq3/gXG/T2cAOJE8AShO/z3j9y/IhlS9NewaY421QaiJelmXNOCC2lmDOn41dVNo0S/eCV9zXH5rB9C8BflVUUNJmfL06QMQxj2bdjfDgtPjXXAoqeBflQY7I4z+RARkgd0C3XowwkYn5A6hKdkQhNjAp8V6bLPE8jXMNO233c+cHQ9ZNNBsOdwkKnlrfyUQ+c=</Encrypted>]]>&ListCreate;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostCreate;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22fBS5NpK+Q+x1xx5i0dEfTdydH+C0mgpzSC578ny8CnfGc1Jfc2fA6Wbg2KltTKqbcBwB9xzfYNfIUyyEiUd4t/3x++OzC8UXiZDh4yk0XXl1TRyilAo4CQxlgctFMvsoasvltu0aKIJJRwrmTRiNbw3a05iKVp5ZxSpy1o6LreUUSNpupxnHLiG9pgQ/nK0UtCkh4ZRsS/RBD8BWORj3A1qf17VAnPEpsdu5JtkDG+SwACdByMXVAZVo78CZw/TpEmm87DoYlLg93Dj9EHZdDnTSnxU29OV9rJheu8WPgEDU7CUPhgVqOlqlEMMlklqwQwK7J1vMijLTjZwns4/e8NpGpTd4IRPMlRSd2aM/yzZWiLvxxn9UdtiH0KiBqsypYc9fFx7/iMxFFF001uNRhuYWsSij34OnEsRAYbHnAMLQb1J0rDwuuTFCnZE+VkQSks9bl1mmbI1cIpr5caxJfsi2qSTIpYRgZ4b+ObBD/17cs0dpGkfSuyBVzZDeC5DAoL8aQ4UubE9S+djpIsG4JQVM60w2HnLTZyxwkWoCGNrjqanO/hhqAfDaHcRvj/wZtmpyP3isOyGRMtgo3lfZR4=</Encrypted>]]>&ListDispose;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostDispose;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22aruzzfSXyQiASwIXNWDpHIsRvCRQ9J0uy6GuHteRq6VP/mXJhinRZ9OMCUj+5Pyz1+aJrgX7t2EWKenMY2iaVAtx6rATjDXD5c8+uuGacez22K7D20gY64/8JjKavzuGguRZE+FF99uklFjZySTr03jMWugk+/FGTPkODogbUFnxGHrGFBZb6Rxg6bEgkfxTKJydRkTEVqRVYLKtJrnCzeB/oKTKRL0gSpJV9A6lb3thBv+KBIn7DG/EGsufB9KWC21E22DA0Zto7gQvm5KYAa7UV3gU9/koKO6Y4SyMJYq</Encrypted>]]>&ListShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4T7rjwMyfNaYiScZqdKE7vx94Z5ta1YH/L8FdXVlZo8KkyM+BtQQNcZk7mdKL5G+45d73hsHaY0UF8NnB2EOmYFExZTdR+X/cVMhU1MQNFSJiRz3+DFVoJvZPmkLHs8ocFWEFqZteLDUY1Oi7vMk3Bw=</Encrypted>]]>&ListTabChange;&PostTabChange;<![CDATA[<Encrypted>&TyR0y9UWID/KUgZp0F+wP4mZc5N+9OVqtDGQIk4DjGA=</Encrypted>]]>&PostTabFocus;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22TgUTPZ2dcLCXC0JLs+ueAI=</Encrypted>]]>
      &ScriptVoucherNumber;
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22QIR+FbF1QDe7yjBFBVgtBDp0CKP3CaLGLXaLE6ZewlpJn8G89VLqS4Ycmct5QkGJ4mNfHAUYWYesKKERaCSDwY8NLRGrZtPZvwvh0UtKXS5aGx04iu2OpEphH1r67kg+oz+DwCXvdwZabNGcuIWmA0t1C9lZe11/A25XpTiXotAbgtSaGx9ZDIdp3ri4aVAMz5JsBnaeWf8zwjQGieKiQB2KlJRAvqTHzJYF0KR70MddSOdQiuzg3vbbMQq2e0v6kZuN2wpPoGTyI+ZpDmd2AwezXX954b7j7B4amRg6VjJtK6HzDirGD2K5voqvqSp6pCcl0oSAxJplGUsu7yo/6AbpVemb4Rf9OUW9oL/EN5HNiW7HMGBSNGRO9KMbTPuCHYT2uD6IShsj1/+IrInTFI=</Encrypted>]]>&ListScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4bs7UICdJoFL8+YICCU7EDEyfp4DOAw2zy3ytuW5BTDcSizCoFqsIp1ggCyEkQu+Gw==</Encrypted>]]>&ListRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Th/PFDkGoLpy2TTZvHIwTBagzWcjK1CTU3c47x8zNRZ</Encrypted>]]>&ListResponseTicket;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4QTkFFG6mug5bCfbriUQnmZx2ZbXXckGX3n1davYduSmFeQqAuO58mRNaN/M3pDc4AihYDiCh6R/OdIi8ooiE3uqS3/hXm/Nxu5CiPCcGKe61j8cKmYtvuvAMlOWQuWJMBmfYqgGK8cU4+d0CMIFeWueULTxubMs9285QcnLOsb7</Encrypted>]]>
      &ListScript;
      &PostScript;
    </text>
  </script>

  <response>
    <action id="Course">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm7Ph/lOQRnRLx+txl4rpRWmsJUomtANorAt4PYF6yEMsMg7N/b/uGHCnmJc6pnNmLLIPZgihygxZDcxU628gb+/fatdh0zd4XD9PGcP5VOPJ0umsraPKPyL1WBSJaZKGBuj8l9d1BNExFUDsnRT8gYqtwAJ+CAgxgmPDzWoM2c4lzD53gw2LuiSVOwvJpACLkyRzq4+iBW7IktYtyy+je0Tt9QQo0kiCSzVqeckixcozm8uPI03IOUZo3mVt+v17gvTAXiahQ3p4f1Mu6Xk+qyQzw6K839CSVnPKM8T6JcPfmsejUfQ0HwDWjBa2QirdlA=</Encrypted>]]>
      </text>
    </action>

    &ListTicket;
  </response>

</dir>