<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
  <!ENTITY XMLWhenVoucherInit SYSTEM "..\Include\XML\WhenVoucherInit.xml">
  <!ENTITY XMLWhenVoucherNavigating SYSTEM "..\Include\XML\WhenVoucherNavigating.xml">
  <!ENTITY XMLWhenVoucherCopying SYSTEM "..\Include\XML\WhenStockCopying.xml">
  <!ENTITY XMLWhenVoucherClosing SYSTEM "..\Include\XML\WhenVoucherClosing.xml">
  <!ENTITY CommandWhenVoucherBeforeEdit SYSTEM "..\Include\Command\WhenVoucherBeforeEdit.txt">
  <!ENTITY CommandWhenVoucherBeforeDelete SYSTEM "..\Include\Command\WhenVoucherBeforeDelete.txt">
  <!ENTITY CommandRecordHasBeenChanged SYSTEM "..\Include\Command\RecordHasBeenChanged.txt">
  <!ENTITY CommandCheckVoucherHandleBeforeSave SYSTEM "..\Include\Command\CheckVoucherHandleBeforeSave.txt">
  <!ENTITY CommandCheckVoucherHandleBeforeEdit SYSTEM "..\Include\Command\CheckVoucherHandleBeforeEdit.txt">
  <!ENTITY CommandCheckVoucherHandleBeforeDelete SYSTEM "..\Include\Command\CheckVoucherHandleBeforeDelete.txt">
  <!ENTITY CommandCheckLockedDate SYSTEM "..\Include\Command\CheckLockedDate.txt">
  <!ENTITY CommandGetIdentityNumber SYSTEM "..\Include\Command\GetIdentityNumber.txt">
  <!ENTITY ScriptVoucherInit SYSTEM "..\Include\Javascript\VoucherInit.txt">
  <!ENTITY ScriptQueryData SYSTEM "..\Include\Javascript\QueryData.txt">
  <!ENTITY ScriptFlowFilterCss SYSTEM "..\Include\Javascript\FlowFilterCss.txt">

  <!ENTITY APVController "S2Approval">
  <!ENTITY APVApprovalType "01520">
  <!ENTITY APVDetailTable "ds2">
  <!ENTITY APVHisTable "as2$000000">
  <!ENTITY APVCheckCategory "case when @ma_dvcs = '' then @@unit else rtrim(@ma_dvcs) end + char(253) + rtrim(@sl_yc)">
  <!ENTITY APVVisibleStatusNum "3">
  <!ENTITY APVHiddenStatusNum "4">
  <!ENTITY APVStatusNoAction "0">
  <!ENTITY APVStatusOpen "1">
  <!ENTITY APVStatusApprove "2">
  <!ENTITY APVStatusClose "5">
  <!ENTITY APVStatusPending "9">
  <!ENTITY APVCategoryIndex "6">
  <!ENTITY APVXMLFields SYSTEM "..\Include\XML\APVXMLFields.txt">
  <!ENTITY APVXMLViews SYSTEM "..\Include\XML\APVXMLViews.txt">
  <!ENTITY APVXMLCategoryIndex SYSTEM "..\Include\XML\APVXMLCategoryIndex.txt">
  <!ENTITY APVInitExternalFieldsDeclare SYSTEM "..\Include\Command\APVInitExternalFieldsDeclare.txt">
  <!ENTITY APVInitExternalFieldsSelect SYSTEM "..\Include\Command\APVInitExternalFieldsSelect.txt">
  <!ENTITY APVCheckApprove SYSTEM "..\Include\Command\APVCheckApprove.txt">
  <!ENTITY APVApprove SYSTEM "..\Include\Command\APVApprove.txt">
  <!ENTITY APVMailApproveInsert SYSTEM "..\Include\Command\APVMailApproveInsert.txt">
  <!ENTITY APVMailApproveUpdate SYSTEM "..\Include\Command\APVMailApproveUpdate.txt">
  <!ENTITY APVDelete SYSTEM "..\Include\Command\APVDelete.txt">
  <!ENTITY APVWhenVoucherCopying SYSTEM "..\Include\Javascript\APVWhenVoucherCopying.txt">
  <!ENTITY APVSetVoucherDefaultValue SYSTEM "..\Include\Javascript\APVSetVoucherDefaultValue.txt">
  <!ENTITY APVSetReadOnlyFields SYSTEM "..\Include\Javascript\APVSetReadOnlyFields.txt">
  <!ENTITY APVHandleStatus SYSTEM "..\Include\Javascript\APVHandleStatus.txt">
  <!ENTITY APVAddStatus SYSTEM "..\Include\Javascript\APVAddStatus.txt">
  <!ENTITY APVFunctionScript SYSTEM "..\Include\Javascript\APVFunctionScript.txt">

  
  <!ENTITY Check "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu4uoR0/pvz4HqzjH5QM949Kv/AeZHwEeiB3XY7zK+dT/sjzyVAOUuMNSOU3IJYTlPZUX1zio5K5jqNK5ESDh+wL4Dm0jbkY/mz10XZuZMhqdUXU2xgTPI2BTR9pbH9CI/1+h1P7PljwuL2LKCzYErK+jJLPpQYjmSgg5IziQl5gwwFwFdQayJ6WmAp/tv6YJJ+hZ/E10aVcmBMCTfII7oDOiJNd3VYreXDop+l1V2TJuc1wEvSAADnbMOr2wq2bQascaEFkfx4BXB5ixf4Z/rGnJJFTUpNeRoq54pwzlwM4EgMVI05VmdvQ711H/eQrivg==FastBusiness.Encryption.End&#37;FastBusiness.Encryption.Begin$YQUxiiVw6irO9OkPGnodkYM+o66Mowlns7xqa06CML67cnslUd6daZwc1i0ogNoIFastBusiness.Encryption.End&#37;FastBusiness.Encryption.Begin$qxo35CQq7utIjp3OJ5r0CYEto5nD2+UsMkdnqH+R2WLdKe4LckYt7lf6fCkOgvhuo1OHtcm5licxZJhshAVnV6++JVvWLBZjAXHR64ZlD5JiOwehtfzQppnvaUtulbojWf1javhiudcpvgAHLPGZ8eKRr76SV40uHdYrjRCoN95mD8IfL6kloEGO30v04a+zFastBusiness.Encryption.End">
  <!ENTITY AfterUpdate "FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssQjHT2vn2xmreKKewvv2380sIvHbnGgnhg/s/TVRF+1GLrbsDtgI6sSDGHw6s+ptVFhKFRDhGf8j5wLIe7HiSpCV+38vdqQBw70K2hh7H2k/v3Et8Uedmgm8jLyMaGGHTcQZy846Gr41HbjuzLO0YhZRFokHBy1/4xWWlOCQ5WtkQKt+S80rwL7XD90I2L5g09qSVU8T6cBO5PBrGcY9X845GYXZBTvoeGLES+GnF5uFBr/XhkNgJS/kiEj0p+zCG+jqxWKNW37Gbudl3waQWGS0pTKCWRpgtlGhaEuGu5MjfMh2CF+sWTVzBJFxAo5ZbQ=FastBusiness.Encryption.End">
  <!ENTITY Post "FastBusiness.Encryption.Begin$Er6kBCOukK5FxLFOw1tnB5qmmkescj1Mh+30aTalXcaSw8IWetqeVLvqfAq074VspvZIDaiB3kqqgdN1UkwSPSCcjeh1weZvHZzBMlItI8NjImU21xlZghikVdK3wwvHFastBusiness.Encryption.End">
  

  <!ENTITY % PostNotifyApproval SYSTEM "..\Include\PostNotifyApprovalVoucher.ent">
  %PostNotifyApproval;
  <!ENTITY PostNotifyGroup "13">
  <!ENTITY PostNotifyCreate "exec rs_CreateNotifyS2Tran @stt_rec, 'ms2$$partition$current', 'ds2$$partition$current', '#notifyContent'">

  <!ENTITY % VoucherDeleteLog SYSTEM "..\Include\VoucherDeleteLog.ent">
  %VoucherDeleteLog;

  <!ENTITY % VoucherEditLog SYSTEM "..\Include\VoucherEditLog.ent">
  %VoucherEditLog;

  <!ENTITY % Extender SYSTEM "..\Include\Extender.ent">
  %Extender;
  %Extender.Include.S2Tran;
  %Extender.Ignore;
]>

<dir table="ms2$000000" code="stt_rec" order="ngay_ct, so_ct" id="SF2" type="Voucher" uniKey="true" replication="1" navigation="true" name="cookie" check="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="yêu cầu sản xuất" e="Work Order"></title>
  <partition table="cs2$000000" prime="ms2$" inquiry="is2$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_lsx" allowNulls="false" dataFormatString="@upperCaseFormat">
      <header v="Yêu cầu sản xuất" e="Work Order Code"></header>
      <items style="Mask"></items>
    </field>
    <field name="ten_lsx" allowNulls="false">
      <header v="Tên yêu cầu sx" e="Work Order Name"></header>
    </field>
    <field name="ten_lsx2" categoryIndex="9">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="ma_gd" allowNulls="false" clientDefault="Default" defaultValue="1">
      <header v="Mã giao dịch" e="Transaction Code"></header>
      <items style="AutoComplete" controller="TransactionCode" reference="ten_gd%l" key="ma_ct = @@id and status = '1'" check="ma_ct = @@id" information="ma_gd$dmmagd.ten_gd%l"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb4LXW3G/8fV8D5ZJNQD+j1vOMoNFneLFQkf/MC0Th2XjQ==</Encrypted>]]></clientScript>
    </field>
    <field name="ten_gd%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="loai_ct" hidden="true" width="0" clientDefault="Default" filterSource="Vacant">
      <header v="" e=""></header>
    </field>
    <field name="so_lsx" allowNulls="false" align="right">
      <header v="Lệnh sản xuất" e="MO"></header>
      <items style="AutoComplete" controller="SFCMO" reference="stt_rec_lsx" key="(('{$%c[ma_dvcs]}' = '' and ma_dvcs = @@unit) or (ma_dvcs = '{$%c[ma_dvcs]}'))" check="(('{$%c[ma_dvcs]}' = '' and ma_dvcs = @@unit) or (ma_dvcs = '{$%c[ma_dvcs]}'))" information="so_lsx$phlsx.stt_rec"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb6ARXXl69ihEOYfejtguR9Mht+GO+WtHPI0kWJrX7GeP5gzsKvkJLg7/zCr2EzG++zU9jpWYpwFFTZXXvlR720U</Encrypted>]]></clientScript>
    </field>
    <field name="stt_rec_lsx">
      <header v="" e=""></header>
    </field>
    <field name="ten_so_lsx" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ref_lsx" readOnly="true" external="true" defaultValue="''" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_sp" allowNulls="false">
      <header v="Sản phẩm" e="Product"></header>
      <items style="AutoComplete" controller="Product" reference="ten_sp%l" key="exists(select 1 from ctsx a where vdmsp.ma_vt = a.ma_vt and a.stt_rec = '{$%c[stt_rec_lsx]}') and status = '1'" check="exists(select 1 from ctsx a where vdmsp.ma_vt = a.ma_vt and a.stt_rec = '{$%c[stt_rec_lsx]}')" information="ma_vt$vdmsp.ten_vt%l"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb7O8EheGyWBp7OzkyeKxaXsIwTIfqYkVHN7RSSROjlVYA==</Encrypted>]]></clientScript>
    </field>
    <field name="ten_sp%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_lo_trinh" allowNulls="false">
      <header v="Quy trình sản xuất" e="Routing"></header>
      <items style="AutoComplete" controller="CRRoutingCodeList" reference="ten_lo_trinh%l" key="exists(select 1 from ctrtvt b where phrt.stt_rec = b.stt_rec and b.ma_vt = '{$%c[ma_sp]}') and status = '1'" check="exists(select 1 from ctrt b where phrt.stt_rec = b.stt_rec and b.ma_vt = '{$%c[ma_sp]}')" information="ma_lo_trinh$phrt.ten_lo_trinh%l"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb4OUSB3W18fGLVY9nlGy5+oBkw/9/N62FxPPvf91RNqgw==</Encrypted>]]></clientScript>
    </field>
    <field name="ten_lo_trinh%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_ca" allowNulls="false">
      <header v="Ca" e="Working Shift"></header>
      <items style="AutoComplete" controller="SFCWorkingShift" reference="ten_ca%l" key="status = '1'" check="1 = 1" information="ma_ca$sfdmca.ten_ca%l"/>
    </field>
    <field name="ten_ca%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="sl_yc" type="Decimal" dataFormatString="@quantityInputFormat" align="right" allowNulls ="false">
      <header v="Số lượng" e="Quantity"></header>
      <items style="Numeric"/>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowContain="true">
      <header v="Thời gian lập" e="Created Time"></header>
    </field>

    <field name="dien_giai">
      <header v="Diễn giải" e="Memo"></header>
    </field>

    <field name="status" inactivate="true" clientDefault="1">
      <header v="Trạng thái" e="Status"></header>
      <items style="DropDownList">
        <item value="0">
          <text v="0. Lập chứng từ" e="0. No Action"/>
        </item>
        <item value="1">
          <text v="1. Chờ duyệt" e="1. Open"/>
        </item>
        <item value="2">
          <text v="2. Duyệt" e="2. Approve"/>
        </item>
        <item value="3">
          <text v="3. Đang thực hiện" e="3. Opening"/>
        </item>
        <item value="4">
          <text v="4. Hoàn thành" e="4. Completed"/>
        </item>
        <item value="5">
          <text v="5. Đóng" e="5. Close"/>
        </item>
        <item value="9">
          <text v="9. Đang duyệt" e="9. Pending"/>
        </item>
        &VoucherLogStatusField;
      </items>
    </field>

    <field name="ds2" allowNulls="false" external="true" clientDefault="0" defaultValue="0" rows="194" filterSource="Tidy" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="S2Detail" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    &APVXMLFields;

    &ListField;
    &PostField;

    <field name="t_so_luong" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tổng số lượng" e="Quantity"></header>
      <items style="Numeric"/>
    </field>

    <field name="ma_dvcs" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="cookie" external="true" hidden="true" defaultValue="''" allowContain="true" filterSource="Vacant">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="254" anchor="3" split="4">
      <item value="100, 100, 337, 8, 58, 42, 8, 100, 0"/>
      <item value="11--10-11: [ma_lsx].Label, [ma_lsx], [ma_ca].Label, [ma_ca], [ten_ca%l]"/>
      <item value="110-10-11: [ten_lsx].Label, [ten_lsx], [sl_yc].Label, [sl_yc], [stt_rec]"/>
      <item value="111-----: [ma_gd].Label, [ma_gd], [ten_gd%l]"/>
      <item value="111-10-11: [so_lsx].Label, [so_lsx], [ten_so_lsx], [ngay_ct].Label, [ngay_ct], [stt_rec_lsx]"/>
      <item value="111-11001: [ma_sp].Label, [ma_sp], [ten_sp%l], [status].Label, [status], [ma_dvcs]"/>
      <item value="111: [ma_lo_trinh].Label, [ma_lo_trinh], [ten_lo_trinh%l]"/>

      <item value="110: [dien_giai].Label, [dien_giai]"/>

      <item value="1: [ds2]"/>

      &APVXMLViews;
      &ListView;
      &PostView;

      <item value="11000000: [ten_lsx2].Label, [ten_lsx2]"/>

      <item value="----10-1: [t_so_luong].Label, [t_so_luong]"/>

      <categories>
        <category index="1" columns="769" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>

        &APVXMLCategoryIndex;
        &ListCategory;
        &PostCategory;

        <category index="9" columns="100, 100, 69, 60, 40, 68, 100, 0, 8, 108, 100, 0, 0" anchor="8" split="8">
          <header v="Khác" e="Other"/>
        </category>

        <category index="-1" columns="100, 100, 337, 8, 58, 42, 8, 100" anchor="4">
          <header v="" e=""/>
        </category>

      </categories>
    </view>
  </views>

  <commands>
    &XMLWhenVoucherInit;
    &ListShowing;

    <command event="Created">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcOmR0LZ5FGpUcPM63leGCTE9YYEIamNnKl4/6DphHxHt+S87MKKvr8wkB949vC12hb2rGE1/7kdCIOLl+iYyqCg=</Encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvl04AQbI7kzeDkVHKYYxt6ioX2dlA71hiUG10e8IUM232bL0R53xmxxBG3dKiKlNtfkkWrUQYgrRg9ZE8K5ntHYXW0KtyDxzHGfukaqG4GHSg==</Encrypted>]]>
        &CommandCheckVoucherHandleBeforeEdit;
        &CommandWhenVoucherBeforeEdit;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHKix8BWItqUg2G+17EWtfwMvAahnyAkjUTnVOlamN5QDCjWziQ3ZZE5Xe8JMjFLhg==</Encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvl04AQbI7kzeDkVHKYYxt6itb9oc3RnP5TETD8Hn8rWw4fsCbPAFMOR04SDVwPyIl/KZfCyKjGcSxSajjtYwIH/</Encrypted>]]>
        &CommandCheckVoucherHandleBeforeEdit;
        &CommandWhenVoucherBeforeEdit;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHKix8BWItqUg2G+17EWtfwMvAahnyAkjUTnVOlamN5QDCjWziQ3ZZE5Xe8JMjFLhg==</Encrypted>]]>
      </text>
    </command>

    &XMLWhenVoucherNavigating;

    <command event="InitExternalFields">
      <text>
        &APVInitExternalFieldsDeclare;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuyaVpCbdGljJ0ivNhQve8w9sdETyNqSwWJr6hD7jOM0JKXjoKkTaytf6yF4TXjha9cDwC5Zz29GdvaGQ2ndxuV61bPqTWz4TVez0YnfxEKPBwhxCHtMcYqhwU6rEwOu9xN5W5yqngXmudgpv5ijJLmr0fLgp2SCBq3nux+ZFlgHEtp4KI6NNTiTGBIHQfkFWCVKJLV9JCjSsBcW8V+GQpzT1xPeYG+Mi9y8hPJRJLyUTUWQnPmtbatuZqJHEVLTCkTnkGC6EZr9oiR7LUeGctwCGBYYKS8W1scG3ZLjRLA/hnRkEfPJv9e52/Vj+3cjKwVYmgxVZBrrI5sfEv+kAgYEQJBl7P2LnPfiQlDqxHjbp15OkcvEcgRwQbrYWEjKVy/TVotUHppCbCMVAx+fJtozcIeHVql78OZjuv7UEXnzg</Encrypted>]]>&APVInitExternalFieldsSelect;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcJmqsAk72Ii7Myu4XNWxBZ7LFRJnpRsOvqw+sGYYBmMK</Encrypted>]]>
      </text>
    </command>

    &XMLWhenVoucherCopying;
    &XMLWhenVoucherClosing;

    <command event="Declare">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz/Y5C4Hib64R6fQZYNBXq0XsilTChhX+GBlr+mYP7U6dYGhRGRdRYqJd147bhkYCkSXCMOTH2nymCVt1Dk+l32IvEcieOkHKj/QsIK5kJiZ2RPjYOb4aWUq3S8/Cwp1G7vWyiSVwneLzdVnWZCvS33gLqzqgxY4gyq1N9mMoroZ0Xd1zgZPsQSJ8yGS5qS4VdRScvxEIdOty82E82Zkqbxcmh1hKnRso8ocfI7aRkodPzNaRIZy+k9joexY14wvV+oQATf69xgMcEgHe1+LOh5CRu8Q38zRBpEYKvtDOlXlbQgt80V1YKVgOupumL/JDKKRtFm3Xnd+GcwHgpcD6+/VleOKSfRZhbdmIZX3AHaKfxwP7y9Umkdrz/2Btzh32g2x58/O/MUWnryNdEUAozGJ0i5o6CNl/gEM8CG0VglVpSTy39ce8gQwm4NbTBGveerNn1kL2kWGSGI8gpZXW+b4ZR9PzgEkqpABzQqtiTcoM9IyI9GAWLOHa707IZAI9kC9gISykDEbzzkzS8msuGBCJRdJydHxZf2AQYPfHTXNS1wFtijAv/kdiU8IHfNMyIVx1HkPa/NLCIzf1MHU92vNg/KDkIv4F+2OjvX2jSOX</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        &APVCheckApprove;
        &CommandCheckLockedDate;
        &CommandCheckVoucherHandleBeforeSave;
        &CommandGetIdentityNumber;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu8d1x7neBWeMKf0bOS0OpKwOnwdVw4prpIQv+mumC+1g7Jsmb2QcZ05+EbiwOCKqdMM0UgsQTmNg9rvFG6gHW15DPS/K9WU4G2SSLtzt3/CULDZ2oFONL5Q/XVmd4yix1LgoL4Q6j/SedEmwQaC/rWhUDkpXIZcXOl9kvA8KstjHq4S3mcCkntFIoUYNatlqr3wpDVk3z2Md965fzBmZyGYOH1AEk4JXes5yF/v78V7Ew83ysYQa2oRks/RpPq7a+ClKIiaRgljYDd8Rjfitmpjl/tChm7uMyi4C+h24UBwb/ke65vlIkjdc4nS1yAKCRkpfqeMI2tHgJQJjKz78Tzo=</Encrypted>]]>&Check;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcMLD5X3CxYsVxnCkXoptd50biKC48OsUlyBAM6lLXsSxZQHWt42nmasuvA8Ha5cIdasa8DZLVvM7P3z9wS24AsmQLKbw8mG2V/MRxLSGfqT3oTM2WWW8ikHRkNjW/GaOi8xV9ASaMYk3VxIxRkIqO5PaR3VImxCxhbnhRBF/FuvY</Encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcM6h6gV4UiHvsVBOMqorbiOdI4f0VCrzO4gSrU/YiUMUZ0tohFVpugr8pXVzCf40Fkvgi6ghTM64OBClhJ2mtOw=</Encrypted>]]>
        &AfterUpdate;
        &Post;
        &APVApprove;
        &APVMailApproveInsert;
        &ListWarning;
        &ListCommand;
        &PostInserted;
        &ListQuery;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ05bww1DwCx6t1rrcU3se34JmodDlEVwoSSM8lPeIilp5rykxi1xP8tCTX0t8Ctu4cOsjPaH2SZ/u+e+TIYb8Dac=</Encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        &CommandRecordHasBeenChanged;
        &CommandCheckLockedDate;
        &CommandCheckVoucherHandleBeforeSave;
        &APVCheckApprove;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu/u1bayJt6VoileYkuRztCOde03jaU7JWAV69JDczqVwCOsGmcJr2/tEH8+WbbMlaO64ZmxMC0z1Pp+3ZXG3vv4bW84Xyu6wbyIqXagsL0FVAfBg/l0vzP74TuMEPQDC1LCOdQBthHCQn61lpSdNs4v8UpDZIQafxVa32RcL/KHZvcym7Vf5jBYLshahNMpK2RG5EedGEw7nM/+aCKtF+dkLYPl1LTs4IktL2kvIE1d3WVJ2m4FiDp+Z2nhjUYT4E9fMAcrri20HAgAv1dXqGywBy5Hfms5aACDxcnsrFThp/Fb6gz2vJ6PPLWNL0vaFUEy3XziuTsaiUsYm+gQMkUEPSKyAzvqXdpbrbCcq3bg9EU8n63DMI8ondJvPZyTUJ7WB4HO6s7fZhP1QRHT3oEbP4HRpF0qhV4qerFc2Zutx+9idkWhnhQS7BHdPF1jn7ceM2pr8UU3ogr4yYcWXSAGWoT5Ea0dd2nHbBynj4SiI5u5vRhKzgRSWmvkOblJzKzU0xDU5eNV8PMiJSWWPD58=</Encrypted>]]>&Check;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22dSsrA/ac74vbUYdAJ19DIuxiUlX183MeWGGzkHvuRak</Encrypted>]]>
        &VoucherWhenBeforeUpdateLog;
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Z9uu9TKVYFHFUnuRWkCu9kRlZsTKqIn8MlZEPMToSOUvqm6CSCwbvI3WESzfGiwUN0pRRL4x50aRtZoEVQ07Q/FGS4KXb2QEkTs+HmMoezgvB/tWQ/Ke0ASaw+CG8eku5XGO/rRAhFWDSFxE4cRsHUGvpZTL+pL8WH17Ie3whA7/cKaF6KDgvKWGs5T6t27qzCm2j68lA2pYUJJXw94qv4fyXNICOOCVXwsNp6aBK+MgVNMm5GYYSTXFOVidVFl15ZqRThTP7B2hIUiZoKCR6CwHJayi9DDIabjyUWmB9MdSQz3m5ne3OGhEu2iUfIRkQ==</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22UfMmMA9zpl8zSksTvIwT2ogB69mOKBUeFrnwY/fMJ1sWYLXrKWPj+8S08g/AvDuky8dLmFmxBCbqDhed07Wq06BBhdUQY0DsfxluGb9JlfZ728O/ZTdFh0aUOBYf/W4XDGXgsLPAx5PGGQzV3tIeZxeYyCs3hLUJPPBRFY2AqHKMfd23xujIIsFz3liJ/crEZJZ0U2lR2A4+q6t/pLIT2ViUVPI5KkOXZBETd/jHX6X</Encrypted>]]>
        &AfterUpdate;
        &Post;
        &APVApprove;
        &APVMailApproveUpdate;
        &ListWarning;
        &ListCommand;
        &ListQuery;
      </text>
    </command>

    <command event="Deleting">
      <text>
        &CommandCheckVoucherHandleBeforeDelete;
        &CommandWhenVoucherBeforeDelete;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuy3OevkYnNKsbxnlqUAXVMweqG91KPB5P2FRVfUAxM/eXPVBrQKhhK2SeppqJjnt3U7GZtCedPaI8s5c3dDpqaJC+kzQ394Xt/zCjRVzrOmqezStyD19owgdmYAM/ydo2v8yoxH4ysX+715tNhX/2hGsIwK7SnGrJQM/Cs1v3Z0WwDysrvyv9YzPqzS1cu1wb0Jp7BUV5UMhg6CWtNgpjmWjLgSuOHLy4JIoIPdIrEBwQBiYrlixjda6ztgd2UZoW2awj5TNPAzMIEgUPyiaGAw=</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu+e4CjJCf9OrMfSVE01w1/tkSg3QAgJduVLJlBKe72/r8ITjfQYYyiucwtFWWk4kltn9qsvSaV7To1QW798Cze4=</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4O4ojEvRAK9jHGAQP5kHB2/GbuHxrnJs5XG6fCW768cAoHASqWSOiYf6TGNM0GosA==</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu6p1uaPH9cTfaVeBS40Bo7BJtAJndi5R5r0LL26RdTW9R4V/KCEEdVVC7HevnaM4WA==</Encrypted>]]>
        &APVDelete;
        &VoucherLogUpdateStatus;
        &VoucherLogBeginComment;
      </text>
    </command>

    <command event="Deleted">
      <text>
        &VoucherLogEndComment;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuypxWhbJCJPtHgNnuGu1+0gPYQ8mxLDcjh2k4CN0ys190FEfoDa4tgRuh2KRTzskkX/QAcNa1vo62/CzWOESguo=</Encrypted>]]>&ListDeleted;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WNW5tM+6Sho8Vjns2OyPfA=</Encrypted>]]>&PostDeleted;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcIaF5R32Ll5k0Mj/ohn8QB5Mip4en6CM7nbzfGM/1nfl</Encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<Encrypted>&oKF07heTiNCG/jYW7jL2EflyFf3P1FC9IkBNL+J6eMGFdzvkJ8xYOlni2nzT06naQpVqYyQlJ9s1N/FpD18ymlRtu0Fwd8+PYfVbkvkhxMVa+zwO1DCrUOJKod1OnkQBuv2pAvzZqDGYQNDyC2nY8otDdz86gK3YcNpoYwwo/DY624kxzRf9eeNiRHZRV2AnkfhSCyces7j8d/YLO17MtUDfl7s6HsBQUHOMs1haWyH5Y3YFna7a03c4m7wKiPeqrbRESWOhWmy/H87jqcG6aDdkQzGTTjxckabob6+R2I8OtdtO3p74t5JHCGMyZpVgz6OF7bRWY66ign+niyCcDPxQ3cF/xdHSIoplsT/O3Ms4AXbs/GmSSYKxU4Jh9EFydLW1+1tzLS6/oUnI2/trah1UeiYPxy652vF1RDrewc+rK4bZzHYcRNa8cv6HTjSa+yNo1JgoNMu0k9PXeoKQwkGguUtmaFg4D1GRDz3gPoVQa9iy/uBeOXPfsJoOuzRBwdGj5nnIauWVD/PNepFT43K32wysb/GvzZPx8PUo6zmVJjyp7OHG6fPRYxwDUjnxbqX0JPP1Otm0nlJlegj1sjqefxcJuzWwbWXda/kifpEtKUVV+8dGwZ7odZ9IeA53Z4kwnA9u6OKBROVz0cJ4FxnrQXT8lg6MIerhJLid4mHls/gGl0ulU+ZwaQdRmkyHDj6bSKOa2tXht0Ymi3zvn33SQ44e5oU6UUbFDZArQfsZto85HkK1b3JigJ523kJrPtE7TM305OJ8NASb/1hfPewXPbWTa/XeVjVcCutE1EsBTILEVky6INyQ3ZowqZb59MeEWrF8xsKPy6pGvnBCg2DD/ashexDSSKlGsduPku7Cy41Pu5tUCPsnJId9rUglGShpLsyDyuHk19w4J+mINQ==</Encrypted>]]>
        &ListChecking;
        &PostChecking;
      </text>
    </command>
  </commands>

  <script>
    <text>
      &ScriptQueryData;
      &ScriptVoucherInit;
      &ScriptIrregular;
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Z6i+ltm7Bvpml6PC9MTU0ZaXx/NKzlArTXS5oz6ehIL++0ppvth7XlhF96iKoHIZR928bSuY27w+3ZTojfuHa+eFXKMuFoVdtrftTpb217onD8kxffLU9fPMwVD/QrppYICooREesKlfn+J/GuQoT9OTS6NN7jRMlLILwOzVt3zs0W2KqyqxfweJAJ2/T3fJb3GY81UThEtT/OdEKYBErP87hC1xGcDjRKFtMjA+vgAuIAj3O3SUjAjeKo5RR8Ks5Fp1kWJ/dO3rrcQk2pTMNGZFBjKGIMEt4dptydjlhVlsPoHnHsvGorDoHKEplx3y8cZu9f5vlJ4V1Ty2cUJuq8=</Encrypted>]]>
      &APVSetReadOnlyFields;
      &APVHandleStatus;
      <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&VoucherLogHandleStatus;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&ListCreate;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostCreate;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22fBS5NpK+Q+x1xx5i0dEfTfe7ODdsFDrZXod+f3uxQ0+MYv8XGG4TVYOq1SdOrDIew==</Encrypted>]]>&APVSetReadOnlyFields;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4btXzG00c5aWmpYfnDs8E1LoKsESW3fWsGFRjx9Wdn79R1U4lbzFGnKYbrI43rVxHw==</Encrypted>]]>&VoucherLogHandleStatus;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WS5KX+Q+BeiR6pPmL5zKVrKtUN2I68mS+YNu1kzGd1cJBEXG7+jAvci1Jt354JH328nsiAkCDvew5GL57DsilgQdnwR0A3vVad4q6bqAUrFDEo0XcyyPG8K3HvySRv9mcNfw3EbeHTVSv5SN2txA6+ag296u/FRJatJxlUBZXW68skXLaca6XBbNMKwStmZIphkMWiFZb/tUlp0Rbwux5WbntrL2v8YA9XurjrroYZy</Encrypted>]]>&ListDispose;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostDispose;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22aruzzfSXyQiASwIXNWDpHIsRvCRQ9J0uy6GuHteRq6VP/mXJhinRZ9OMCUj+5Pyz1+aJrgX7t2EWKenMY2iaVAtx6rATjDXD5c8+uuGacez8mznuGIhM/ctZL2IVOpCaNMRYQTKCjP7qDHZlPyj2ji8ldiH+zJd/5F/bd2pcb2St3FJoGrkP43FHOi1e0qqBkGI0vvxhJ2PSXF5yBAN6Ok=</Encrypted>]]>&ListShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4ZCdbJ+U2ImncEMAOCRkzWp3ELBWTrCnwnwxQaU25V2toGBzdv2RHejVF3xIstf1bTAb3rx/yDOPpJbXeCqypa2ibzMBAUB1FvPJhb3jQkjO</Encrypted>]]>&APVAddStatus;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&VoucherLogHandleStatusExplore;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4T7rjwMyfNaYiScZqdKE7vx94Z5ta1YH/L8FdXVlZo8KkyM+BtQQNcZk7mdKL5G+412oWvhH4jvXuUVFXIhMRVJcdO26SRO7VINAssS3FPQ3XBpZf8AAse56PJYdv/Aqzw==</Encrypted>]]>&PostTabFocus;<![CDATA[<Encrypted>&N5mdyFZDg+f+N1+BWADWyrbHcGKgLQlHwzG9OeaJurRpUxtRpsiU/VasauyUSukxpCQIczZQQCxY95rZRYLk3jsqllvVV/2fDHYkLG5RS9T7uy17JolUyPtLHY4F1GPVUrq+p2exGiHSJj5zXG4lCg==</Encrypted>]]>&ListTabChange;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostTabChange;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4U+qAd8gO4wvvAG+qT02v12puw4bNjnW50tuBMkxTWhnd0BJC7HS1HhX7RwJtu2u2segHbCtAgTuCVTxGvSpfMfAiYZgOGQ03BoVIHV1pMcCDqL/euKF7ffBU25mSrGFu+WjQrO1PKRT2mdmmKfxY3B1a6Ott4msdJUWBwxYiGfd/7YPgVOlroKn20/Ak7GI4KiyxrQS+ssL0Hjtda6gA4SS+udXy/M5iUxx7tF2/BRamTHI5ZLp8aYRoAY+PYUzbw==</Encrypted>]]>&APVSetVoucherDefaultValue;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4f/EtoBgeEETJ2ri7I7vbnm0wg7pcUSTi8ymZ33IV0RntPXLPVxMGjtPmz64a23yAw==</Encrypted>]]>&APVSetVoucherDefaultValue;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&ListScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4bs7UICdJoFL8+YICCU7EDEyfp4DOAw2zy3ytuW5BTDcSizCoFqsIp1ggCyEkQu+Gw==</Encrypted>]]>&ListRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4V7/6ON5VphdCn3Ayzt7hizMCpHbQ1ULoOfCxG/ePOB0fJy1bFpSIvmY0dCDZ4vE9k6WzLUxQtnkGknZ1GQ/Nwu3xF1bzt+6unjduGtIfgUCtBYLYERcAB4TlYSIZ3PzxJxmpg/tiupBkAQ0sqKvQp9yqqhOJPiCI+0aPzsylIkevuH3n6sWSNKzrVi2WSIsgEbpQvvyKzolVl4TeHwyqpSgbCkDKhg6jANodzQMiq5Y6zVkPtP0CJfUDJcBJ+rPaSsP0FHgwnXOU1t/J5A0338=</Encrypted>]]>&ListResponseTicket;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4QTkFFG6mug5bCfbriUQnmZx2ZbXXckGX3n1davYduSmEphKpRa0WUxaijYYpe7wb03rPSaB/NTuiVef08hdkqS6+xRw2S+sLI4mI8kDn1f9NvYiieRB+9MsUacNH/KlQ+aYlDUUH5Eo5RB85hkjOZs=</Encrypted>]]>&APVWhenVoucherCopying;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22do4ljPH9SFGorQD8H5asGPGiwISQDhmcrrV4WqfWYQYMtzWBNB7hjL+5likFpNJHUesldEB07CuT8NhSe+yBbDEukzumMqb1FElMgEYGYNKxhPNbQygjQOkQ7oXx/nu63h+A2U7ly5/tl4YGhxBCnRbyuw3p07Fg2FawPEMMfdQr5cF1cHOMsbVHXWjLlYv0xMR2r85tQJL0NMDGwql1cV/xRBFooAxRsFUePfNWuehE1RLr0OhiTe5aKsL8bqSIlGSIzKnFh4r5OhwsSK5h4SKwDTdWpx69QgIzR47lr/dvWn4PghucsDPkIakz+b3SHYsji3PmOC9K9g3xYm4vpgHBWKdiMJdS6PVD81hjDk8uCtr6QNR/4zhd7MMYwnkKZmQi4Zfa0MGlbE85U8eZ8qoj6hIW40xPFTAqcVBBAmU2qMY1ajN3faFjsaOBvMnQjHwOak7lGAa7jkgDaZmP9hUqovdIzPXt32Ve3+wUBiIzaD7svJDBFq+Eo8WV9b07T2vE2HV/bFcNAo7D3Fz4TEYZ8HYedPK36hGCGKqkYpYhuNR3T+Fvsqqmt5mkPqzHgt580IfSjvtMrXsTefRms78uD7jYqd5G9C9nwMqVy8wI/tySObQ0xUGOiChNmfb6lyPebOXJ70dJmGG9E62JezfaPxrcZWV/t6JjlizO7M+dd2TtylhV+LZnHeCq9oAJQT1KVD5czOedBPV9hO4Atvqcul/+rO56IO/4mqW+M2ssm+HdwyX3o+edBI9ryGNOVdeYjbLpIodgw5wbFYHhwpQJ5UODY133YmFH3nyC30thKi3NLC1y8Oj0HSnValUmXHDdEZsa28TH7giIWzFbwVWHK+/e8ShnU2FNJcS6oKBYyaoG9RNsU3cZnb+/K/ijv0lOKIBOysW1YlzCouk+nA=</Encrypted>]]>
      &APVFunctionScript;
      &ListScript;
      &PostScript;
    </text>
  </script>

  &ScriptFlowFilterCss;

  <response>
    <action id="Transaction">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPsDWV/47ztSDEgitarYFiB+AKsWAJqqob3qOw7zTlHgNcKGOpVhm0Up69Ho/2MrEpd/OAKPnNaoyrPWUTJkmCGwlfeVeEJO51Sol7AcGlqI1P+OZa9FkIkvKj/zfSFPwg==</Encrypted>]]>
      </text>
    </action>

    <action id="MO">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu8KUSr/baZpnMYFh0X33aWcP3Tu76+IMt6Tj7dIIRv2B1N48q6V9mTrXQKu6u+6DObAe4/9YO356Zywwn5OVgTuMi44dcGMarNyQOd9NjetcNabNmFErmxVwUPHWtbBAwAZkOjsUTmbQ96nU+kfo8ZLGWTTBHjUV+xaxct4tX88plWK9qXD9zXwo5SEdVN7ULRm+JQBzBBAoFPBoUJgwgW+VZMDZkiqAHkGoZY6v1M7ouQLbz02jrEpSaHkWdbLDWzQWii+3Hz+C4510gfn8XaZtrQNz5A9SUtsztPN5zY4+pcaTSUtxc+9+pecV/6juJ/CO8KezLYWYN2XS2AbER0/VDHwlQ89hUspohDppzpmtWhA5ZA5CT3LguAvDlvndDwtcyfIkqDUCkleFaC25KFA=</Encrypted>]]>
      </text>
    </action>

    &ListTicket;

  </response>
</dir>