<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY FixedAssetTable "dmts">
  <!ENTITY ExecuteAdjustForm "exec fs30_FACalcValueAdjust @so_the_ts, @ngay_ct, @ma_nv, @ma_tg_ts, @nam, @ky, @so_ky_kh, @gt_cl,  @gt_cl_nt">
  <!ENTITY CreateStructureAndExecute "create table #t(_01 numeric(20, 5), _02 numeric(20, 5), _02_nt numeric(20, 5), _03 numeric(20, 5), _03_nt numeric(20, 5), _04 numeric(20, 5), _04_nt numeric(20, 5), _05 numeric(20, 5), _05_nt numeric(20, 5))
insert into #t &ExecuteAdjustForm;">
  <!ENTITY CommandWhenFixedAssetExternalBeforeEdit SYSTEM "..\Include\Command\WhenFixedAssetExternalBeforeEdit.txt">
  <!ENTITY CommandWhenFixedAssetExternalBeforeDelete SYSTEM "..\Include\Command\WhenFixedAssetExternalBeforeDelete.txt">

  <!ENTITY CommandFixedAssetLockedBeforeEdit SYSTEM "..\Include\Command\FixedAssetLockedBeforeEdit.txt">
  <!ENTITY CommandCheckLockedDate SYSTEM "..\Include\Command\FixedAssetLockedDate.txt">
  <!ENTITY ValueDate "dateadd(m, 1, cast(str(@nam, 4) + replace(str(@ky, 2), ' ', '0') + '01' as smalldatetime)) - 1">
  <!ENTITY FieldDate "dateadd(m, 1, cast(str(nam, 4) + replace(str(ky, 2), ' ', '0') + '01' as smalldatetime)) - 1">
  <!ENTITY FieldFocus "ky">
  <!ENTITY ExternalKey "and ngay_ct = @ngay_ct and ma_nv = @ma_nv and ky = @ky and nam = @nam and ma_tg_ts = @ma_tg_ts">
]>

<dir table="ct&FixedAssetTable;1" code="so_the_ts, ngay_ct, ma_nv, ky, nam, ma_tg_ts" order="so_the_ts, ngay_ct, ma_nv, ky, nam, ma_tg_ts" xmlns="urn:schemas-fast-com:data-dir">
  <title v="điều chỉnh giá trị TSCĐ" e="Fixed Asset Value Adjustment"></title>
  <fields>
    <field name="so_the_ts" isPrimaryKey="true" allowNulls="false">
      <header v="Số thẻ tài sản" e="FA Code"></header>
      <items style="AutoComplete" controller="FixedAsset" reference="ten_ts%l" key="ma_dvcs = @@unit" information="so_the_ts$&FixedAssetTable;.ten_ts%l"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99NMzeXVuPuKQFhCna1rS6KIcXFTU7xMeEwp05YLBGVXk1xXiUIGjzBQkGnW3ygmBsQ==</Encrypted>]]></clientScript>
    </field>
    <field name="ten_ts%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="nam" isPrimaryKey="true" type="Decimal" dataFormatString="###0" allowNulls="false">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99BxLybAdrMiwNzvfi7gd2LW0fYmesl77WjppcpjWTEHIkqOumn4jAKcUe1VCbZ4wrA==</Encrypted>]]></clientScript>
    </field>
    <field name="ky" isPrimaryKey="true" type="Decimal" dataFormatString="#0" allowNulls="false">
      <header v="Kỳ" e="Period"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99BxLybAdrMiwNzvfi7gd2LW0fYmesl77WjppcpjWTEHIkqOumn4jAKcUe1VCbZ4wrA==</Encrypted>]]></clientScript>
    </field>
    <field name="ngay_ct" isPrimaryKey="true" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false">
      <header v="Ngày ct" e="VC Date"></header>
    </field>
    <field name="so_ct" dataFormatString="@upperCaseFormat" align="right" allowNulls="true">
      <header v="Số ct" e="VC No."></header>
      <items style="Mask"/>
    </field>

    <field name="ma_nv" isPrimaryKey="true" allowNulls="false">
      <header v="Mã nguồn vốn" e="Capital"></header>
      <items style="AutoComplete" controller="Capital" reference="ten_nv%l" key="status = '1'" check="1 = 1" information="ma_nv$dmnv.ten_nv%l"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99BxLybAdrMiwNzvfi7gd2LW0fYmesl77WjppcpjWTEHIkqOumn4jAKcUe1VCbZ4wrA==</Encrypted>]]></clientScript>
    </field>
    <field name="ten_nv%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_tg_ts" isPrimaryKey="true" allowNulls="false">
      <header v="Lý do" e="Reason"></header>
      <items style="AutoComplete" controller="FAAcquisition" reference="ten_tg_ts%l" key="status = '1'" check="1 = 1" information="ma_tg_ts$dmtgts.ten_tg_ts%l"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99NGwEeSbkZkDfpStbHQlfWF0/qw8HSf5vLwiIgs0p97eipZ2dK4tVqGIgw6yZlLLiw==</Encrypted>]]></clientScript>
    </field>
    <field name="ten_tg_ts%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="ma_nt" clientDefault="Default" allowNulls="false" inactivate="true" disabled="true">
      <header v="Mã nt" e="Currency"></header>
      <items style="AutoComplete" controller="Currency" reference="ten_nt%l" key="status = '1'" check="1=1" information="ma_nt$dmnt.ten_nt%l"/>
    </field>
    <field name="ten_nt%l" clientDefault="Default" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ty_gia" type="Decimal" dataFormatString="@exchangeRateInputFormat" clientDefault="Default" defaultValue="1" >
      <header v="Tỷ giá" e="Ex. Rate"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99BxLybAdrMiwNzvfi7gd2LW0fYmesl77WjppcpjWTEHIkqOumn4jAKcUe1VCbZ4wrA==</Encrypted>]]></clientScript>
    </field>

    <field name="nguyen_gia_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0">
      <header v="&lt;span id='idf_nguyen_gia_nt'>Nguyên giá nt&lt;/span>" e="&lt;span id='idf_nguyen_gia_nt_id'>FC Original Cost&lt;/span>"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99BxLybAdrMiwNzvfi7gd2LW0fYmesl77WjppcpjWTEHIkqOumn4jAKcUe1VCbZ4wrA==</Encrypted>]]></clientScript>
    </field>
    <field name="nguyen_gia" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0">
      <header v="&lt;span id='idf_nguyen_gia'>Nguyên giá&lt;/span>" e="&lt;span id='idf_nguyen_gia'>Original Cost&lt;/span>"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99BxLybAdrMiwNzvfi7gd2LW0fYmesl77WjppcpjWTEHIkqOumn4jAKcUe1VCbZ4wrA==</Encrypted>]]></clientScript>
    </field>
    <field name="gt_da_kh_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0">
      <header v="&lt;span id='idf_gt_da_kh_nt'>Đã khấu hao nt&lt;/span>" e="&lt;span id='idf_gt_da_kh_nt'>FC Depreciated&lt;/span>"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99BxLybAdrMiwNzvfi7gd2LW0fYmesl77WjppcpjWTEHIkqOumn4jAKcUe1VCbZ4wrA==</Encrypted>]]></clientScript>
    </field>
    <field name="gt_da_kh" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0">
      <header v="&lt;span id='idf_gt_da_kh'>Đã khấu hao&lt;/span>" e="&lt;span id='idf_gt_da_kh'>Depreciated&lt;/span>"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99BxLybAdrMiwNzvfi7gd2LW0fYmesl77WjppcpjWTEHIkqOumn4jAKcUe1VCbZ4wrA==</Encrypted>]]></clientScript>
    </field>
    <field name="gt_cl_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0">
      <header v="&lt;span id='idf_gt_cl_nt'>Còn lại nt&lt;/span>" e="&lt;span id='idf_gt_cl_nt'>FC Current Value&lt;/span>"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99BxLybAdrMiwNzvfi7gd2LW0fYmesl77WjppcpjWTEHIkqOumn4jAKcUe1VCbZ4wrA==</Encrypted>]]></clientScript>
    </field>
    <field name="gt_cl" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0">
      <header v="&lt;span id='idf_gt_cl'>Còn lại&lt;/span>" e="&lt;span id='idf_gt_cl'>Current Value&lt;/span>"></header>
      <items style="Numeric"/>
    </field>

    <field name="so_ky_kh" type="Decimal" dataFormatString="##0" clientDefault="0">
      <header v="Số kỳ kh còn lại" e="Remaining Periods"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99BxLybAdrMiwNzvfi7gd2LW0fYmesl77WjppcpjWTEHIkqOumn4jAKcUe1VCbZ4wrA==</Encrypted>]]></clientScript>
    </field>
    <field name="gt_kh_ky_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0">
      <header v="&lt;span id='idf_gt_kh_ky_nt'>Điều chỉnh kh kỳ nt&lt;/span>" e="&lt;span id='idf_gt_kh_ky_nt'>FC Adjustment Value&lt;/span>"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99BxLybAdrMiwNzvfi7gd2LW0fYmesl77WjppcpjWTEHIkqOumn4jAKcUe1VCbZ4wrA==</Encrypted>]]></clientScript>
    </field>
    <field name="gt_kh_ky" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0">
      <header v="&lt;span id='idf_gt_kh_ky'>Điều chỉnh kh kỳ&lt;/span>" e="&lt;span id='idf_gt_kh_ky'>Adjustment Value&lt;/span>"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99BxLybAdrMiwNzvfi7gd2LW0fYmesl77WjppcpjWTEHIkqOumn4jAKcUe1VCbZ4wrA==</Encrypted>]]></clientScript>
    </field>
    <field name="gt_kh_ky0_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" defaultValue="0" external="true" filterSource="Ignore" disabled="true">
      <header v="&lt;span id='idf_gt_kh_ky0_nt'>Kh sau điều chỉnh nt&lt;/span>" e="&lt;span id='idf_gt_kh_ky0_nt'>FC New Depreciation&lt;/span>"></header>
      <items style="Numeric"/>
    </field>
    <field name="gt_kh_ky0" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" defaultValue="0" external="true" filterSource="Ignore" disabled="true">
      <header v="&lt;span id='idf_gt_kh_ky0'>Kh sau điều chỉnh&lt;/span>" e="&lt;span id='idf_gt_kh_ky0'>New Depreciation&lt;/span>"></header>
      <items style="Numeric"/>
    </field>

    <field name="dien_giai">
      <header v="Diễn giải" e="Description"></header>
    </field>
    <field name="loai_tg_ts" type="Decimal" clientDefault="1" defaultValue="1" external="true" hidden="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="tang_giam_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" defaultValue="0" external="true" hidden="true" readOnly="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="tang_giam" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" defaultValue="0" external="true" hidden="true" readOnly="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="dv_yn" type="Boolean" external="true" defaultValue="cast(0 as bit)" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 40, 20, 40, 110, 120, 100, 0"/>
      <item value="1100100: [so_the_ts].Label, [so_the_ts], [ten_ts%l]"/>
      <item value="11: [ky].Label, [ky]"/>
      <item value="11: [nam].Label, [nam]"/>

      <item value="1100100: [ma_nv].Label, [ma_nv], [ten_nv%l]"/>
      <item value="1100100: [ma_tg_ts].Label, [ma_tg_ts], [ten_tg_ts%l]"/>

      <item value="1100---: [ngay_ct].Label, [ngay_ct]"/>
      <item value="1100---: [so_ct].Label, [so_ct]"/>
      <item value="1100100: [ma_nt].Label, [ma_nt], [ten_nt%l]"/>
      <item value="1100111: [ty_gia].Label, [ty_gia], [tang_giam_nt], [tang_giam], [dv_yn]"/>

      <item value="1100-11: [nguyen_gia_nt].Label, [nguyen_gia_nt], [nguyen_gia].Label, [nguyen_gia]"/>
      <item value="1100-11: [gt_da_kh_nt].Label, [gt_da_kh_nt], [gt_da_kh].Label, [gt_da_kh]"/>
      <item value="1100-11: [gt_cl_nt].Label, [gt_cl_nt], [gt_cl].Label, [gt_cl]"/>

      <item value="11-----1: [so_ky_kh].Label, [so_ky_kh], [loai_tg_ts]"/>
      <item value="1100-11: [gt_kh_ky_nt].Label, [gt_kh_ky_nt], [gt_kh_ky].Label, [gt_kh_ky]"/>
      <item value="1100-11: [gt_kh_ky0_nt].Label, [gt_kh_ky0_nt], [gt_kh_ky0].Label, [gt_kh_ky0]"/>
      <item value="1100000: [dien_giai].Label, [dien_giai]"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDRLiAjHqZG29IpLn/+vJkAyltgVvEDuhMPseHUu0W1jrl7aEQ0OIR+Co4AB1Q8+ijZmFhQuzgXjG6oOotJcE1s=</Encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        &CommandFixedAssetLockedBeforeEdit;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvl04AQbI7kzeDkVHKYYxt6i02jAFK21hr7a+yxHj8oFFGrT0TUHlfvm3hMzlsYScDmV6gsZBjHPF70ZjPrapMALs3Pwi1R1e8Ab81hS2YziX0I0FXTPZs+nTpgGlvIf4aNLE+zYq6qoWmdK8O0ZuQoM</Encrypted>]]>&CommandWhenFixedAssetExternalBeforeEdit;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHKix8BWItqUg2G+17EWtfwMvAahnyAkjUTnVOlamN5QDCjWziQ3ZZE5Xe8JMjFLhg==</Encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        &CommandFixedAssetLockedBeforeEdit;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvl04AQbI7kzeDkVHKYYxt6ia4XDMcx1FoIIq08b4bJZpbVjAXhuAeZ8AEa5tYn3akA=</Encrypted>]]>&CommandWhenFixedAssetExternalBeforeEdit;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHKix8BWItqUg2G+17EWtfwMvAahnyAkjUTnVOlamN5QDCjWziQ3ZZE5Xe8JMjFLhg==</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDCsi6JAf+jyCXMomNckwhZusTIqPeRU03sJ+hv7O22pAJHH5mIyWKHbWCYUW3fr55uwgs2RR9BQwvxx9/bMmnw=</Encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3nXwc7CpV/PEtituPkQTiSFDa4EZgyR9t8vhc80mH9LyMtYd3Pj8n/S7ek482DCI6AM+7zm2rJV8mkLT0wJFmH+pXmU25zimI+McRZdFv4q6JO48eZ7LLO+msAZxhsLumCTgOMKnT8DHi1v6vXQHOtV7NyFyHg/4kSGsiZlNomYUEmYC9CaFYfzQnUz1c0OjDaGGp3n9BUpmszFh1C7qxpyzIFpdpedG/X+8h6SCziu</Encrypted>]]>&FixedAssetTable;<![CDATA[<Encrypted>&M+kvXi/dU/Pm/PVr5kRbNHAG8+KbbIjo5VSFG2JCLMyiI6Nfn8K66z+5c5DhkBR0M0wtynDVTqjnhtBytFFHX+FB/8nrjdWpgylNu/x7KmLR+13NwjjBDyIoLDfwDP6MSCMhrEJTDSfj008cPEYygw0fPU1V2cfxHc+Gy/GR8LHgCelZlVmsLSmNknlQTHqzefBDbAPEQLjMTn5lwqo6AgfmAPRCltY4n4TzIAf4jN63pZ4asxEg2TEeJ19o4un/iXhuOAV9UwI3i1sSHtiCGA==</Encrypted>]]>&CreateStructureAndExecute;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4WeluCIVf1Nt5YsXYsgQDRtn2tzmqI60aoXQOReNbs/nyFN1Bchl2NjZyNgUU77G+TpXBn5qeUWjYDAS/UqWhTs6FyAo69/XHswH+W23z7yj4ytOEnr3nXzUsc5uV3H7IbXzGWb/KfMdz0V49sOPbCjdYfpZazlP2Dcsj+3JZri3</Encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz/Y5C4Hib64R6fQZYNBXq2idkLpCXzrimb1YuTMpb3aN/7PxwrNmja2J0eINLzr700U0f4EmbPfAuilk2JpKlsfURo/wcuQz9e9AnVI+auxVxG0/YZs4JpoqVAU3I1IQCoM87R9DqwdROgOvHzLfFfGdCct9HGXLz8EqYPqSeNbpJihQU33rR3U7W9506RhXKndoEq4ysobmSDSaNB6CTQmR7TAIy33A5VLhPjEueJXzWHOojfRoe51fRmHE/7uLS4p5FjEzR/HI7W75yGAbqX9OkHGL8Qd9AA6JrJYm4k1itAbQXvNPiyuvW/CbENzX++BsREXPtuHrnvcEIejD/liWk3e5KL+SZtE70Tyh8SLIepnWTkL+Es/GAZmy/K3LupkqOMjQFn9GYhEMIFT3gbGJ5gqm1BrR/145TBPNlkHqFCDjrjRZgcIjc7uX7w7VSadGP1mMp7xN9aGrIXDC9/zX2cOfNTt+SYX+mdKiy5dB0h9ln3mC3Ii4BuICxT7dARkoDHRyJ46/QmJ5QA4cFs=</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        &CommandCheckLockedDate;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcN2JKxKAnBFch6SwKc9HgayuYbj8YcwZjqrfsqeBUDwUlT2MkeG45rnRSC3KSFyYbXSL5SZb0HAKJK0zJCBNUHCX4hzZmzymoCTUFJXWHU+MbTecMQJg+ctn2SXkcZ+MOQ5nPFUQ0CEt0UHf1ZhKQ5eB2dt5bWSuUSbLPcq26UTVkerm8/RgfLfvE9aBUkNefpbd9MDdM7BwzDLwWJMAXRfBIdyK7SyBoxLXEKD2uz2ASWKOK8cnYz9WdFh3HZTWW/GlFQmllg493NesCzVuDAQ=</Encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        &CommandCheckLockedDate;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDPCXOqUAunsmwf/K+O3yp8Ubfvq2dXTvAvl4Z841iZLjtOjRRoS48+rro3dz2OO+OJsz1gJU2OWyYBMbmWsbYro6b2mLSrrzm6b+JkLsFf/kNqsqtFjUureuaQQ96sOf4hwdGlXfuPLn6BSsB3GKG5Yci+D0QoJ53sW6wIr6f/ascPCQs/ja0JfcxoIx7W3cSh4CAq7jYeIHWiwRJNEh5YzozyZVY2oQuYLFNmoTy5/LdipBBUX4jyjemgt5cJPPqO7Re4nosrkJu55qD/XjkNEpd/2hwxWIJ+WmEezOmYCBWdQj3uJT2a5S301KkaNn/0v5cyDs9Ubm/W7pFuqBuR8Mh2iB/pQRtdZmBtvf1rHYOgrxtezS5NwuDvxhGDOAW3vUG5ob0tWQj5G4Vq3nFg=</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz1A0c5BwgEd6wiLsAjFO5wS7ri+7RIHHWN4fjpX/GhbiRtJBASe/a5GsR5uEO6XVx5FwgwJO3/PkPV5Km8qkQHU15SZsM6e6Oy/q+KFvi44eU64DDHg+Zs/YH31vAlZ2l4RTDIFHiyS7bRsOW5zQXInO8NVcDAkLVMriG8WA8e0</Encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        &CommandCheckLockedDate;
        &CommandWhenFixedAssetExternalBeforeDelete;
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&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</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="ItemCode">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm4tB5LPIZz29630EzVUuIlr</Encrypted>]]>&FixedAssetTable;<![CDATA[<Encrypted>&M+kvXi/dU/Pm/PVr5kRbNHAG8+KbbIjo5VSFG2JCLMzDmMvfK+RGVEmY712zDv3lqjkBf/g1GOK3FjlSKyLxiY/BEnrreCTcVQP5UU2n9QjbZjMc7+C/3KvMlLofWjIQa92TWPJopVVAqd9jMVYMpBNMcSzQQ56yBsN0So1RKkM=</Encrypted>]]>&FixedAssetTable;<![CDATA[<Encrypted>&/CeVoo3cM+o2CPgco9dGQ5zQ31/85ZKaXkjfsj959NfewAfvG/c89Wwd1i8YavhZ0PNVhSF4XsRZYMnyiP2dJNCRcKszf8Fza2BF/CnCUgas2AkoAjLAsVbHUfjtFIwo</Encrypted>]]>
      </text>
    </action>

    <action id="AdjustType">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm70Ga6R/UIDlSF4oikabRmqf5o3UcI3MlDhQjG4uGrYy3sJeE3RLLXNZiBrerf+QjMROOn6yRjeW734f3Sxd7/T60vt/BhQ+mmjcJbZI24WzXKPqEdfR2SuEn4+pUiJDyK5n/H3SXhjvku8ib9vfAFXGqbSzXin3Yd/1OyoQkCeaQ==</Encrypted>]]>&CreateStructureAndExecute;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4WLstnYWMBomgqZb/2kIV98VPKBkRR4sCazPAnArEKkntuNYHr7DykWsRZmuYJOo6R/zXunCXnHKQl+kbyT82kpcG27dNWmFqaqjGW12n8A5</Encrypted>]]>
      </text>
    </action>

    <action id="FormRequest">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcGW1E9sjfKLnW2ObDZBipYvKca04tVTvyT4YLXoVmVYFmP5NqBrRtJyWkKIWnjdagMLn/rfieQKZX0TkP5v+XOZ7YhlXCBU/wIbJN4MvSCvI</Encrypted>]]>&ExecuteAdjustForm;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4ToJ9ZlfrZsr8INUCi8q9U8=</Encrypted>]]>
      </text>
    </action>
  </response>
</dir>