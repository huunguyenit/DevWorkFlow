<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Identity "APTranImportForm">
  <!ENTITY UploadButtonCss SYSTEM "..\Include\XML\ImageUploadForm.txt">

  <!ENTITY UploadCreateTicket SYSTEM "..\Include\XML\UploadCreateTicket.txt">
  <!ENTITY UploadField SYSTEM "..\Include\XML\UploadField.txt">
  <!ENTITY UploadCommand SYSTEM "..\Include\Command\UploadCommand.txt">
  <!ENTITY UploadScript SYSTEM "..\Include\Javascript\UploadScript.txt">

  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">

  <!ENTITY ImportVoucherScript SYSTEM "..\Include\Javascript\ImportVoucher.txt">
  <!ENTITY ImportVoucherCommand "init$&Identity;$Status(this,' + isnull((select top 1 m_status from dmct where ma_ct = @@id), '0') + ');">
]>

<dir table="m31$000000" code="stt_rec" order="ngay_ct, so_ct" id="PN1" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Lấy dữ liệu từ tệp" e="Import Data From File"></title>

  <fields>
    &UploadField;
    <field name="ticket" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>

    <field name="status" clientDefault="0">
      <header v="Trạng thái" e="Status"></header>
      <items style="DropDownList">
        <item value="0">
          <text v="0. Lập chứng từ" e="0. No Action"/>
        </item>
        <item value="1">
          <text v="1. Chuyển KTTH" e="1. Release Later"/>
        </item>
        <item value="2">
          <text v="2. Chuyển sổ cái" e="2. Release"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 50, 50, 100, 100, 30, 0"/>
      <item value="110000101: [upload].Label, [upload], [upload].Description, [ticket]"/>
      <item value="1100: [status].Label, [status]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfwv3wLHXTDVbx2DdB9PPcGaDBXwbv0oh/z6PNxPtXBr0B91Yn0501vvwtUQ50sTOYA==</encrypted>]]>&Identity;<![CDATA[<encrypted>%yb3r8nYg0FPwFXMJ1/oFI2eORDT72Joyasi+9OymTT4=</encrypted>]]>&ImportVoucherCommand;<![CDATA[<encrypted>%YOfes2zSil2bWL6UeEJSf4ZtdmPP6ZPpKgCGtTMIA/X/0U2LV7Rk7yZH3lsBOrQL</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfwSZFYAj65RYzXb1/jCQS7LbKpA54gCakU+hnjiXOE3L</encrypted>]]>&Identity;<![CDATA[<encrypted>%yb3r8nYg0FPwFXMJ1/oFI7200INbRFwrRV1ygt8qMKFvYMS2nnkKHRJzehg/NGQyg5N95QkHSh1LGHn1Ue+VCg==</encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70OlhMzIHz1eI5IxL4pZUp0+Q+DFCAfaOCNukXyqVH7r2tUVkQ8y3uliMiKEQ6HucGu120j0ae/lpaSoz3kdG9lgkiJZC8GZlsdXnEoJhgE0JAqDiyCdPTRupZGp1I6w/SA==</encrypted>]]>&Identity;<![CDATA[<encrypted>%/vOP2em6Xhs7Z9GPyNAHjjBNhSB4n36RAHIrC3EsIUZOJpgG4hHoR/Q/8hBmCxWHSUmQylFesVOE3pC3Wxw6g6DMmVv1vBozKq0VnniMXHAQlO5NkMmzW4Blq17syK8lqKEVrosC7hOMH2nm8XIbGLDF0tPk94fmB0my8pW5Phdm7OgeBLKpCRVZNMEbvc2A0GnBa4TqTRcFhvL5+oacqMIa+VuBI+EHtVwf38yu5/ZGh6OxRMCZNBYirywQXFYPbnbPDGutXcEhqCPOhknF7jf28s76Y52dAeqRl/GFAnsQVS8FhzZpcFyzIzMe8K+UJbT/y6dZDTr7+i8gEZTSl/weX4RHRQcP+Pte0BCR/kd5b6frC5Q1STQGJogKoKbrB41LD3/qtHrtVzq+1iouug==</encrypted>]]>&Identity;<![CDATA[<encrypted>%tKdK3MWmxeikauzyRrII1ouUowfb9IzNFwoIb4AE2X6BQOFBMG8ppA2itWr3xRP5OmWNG+1CPuq6p7YIlBwNhD/LPksz2VAsytoTlGPVxjQ=</encrypted>]]>&Identity;<![CDATA[<encrypted>%/AfHL6YdajQfFcOwzqzJsHPCFLHOMub5jKaSv4gpZKyVxodbjS6TqvdckLO11+YlAQV2sIB9CrLQ1zvj79C2RpTRj+VptE9YxfRNnGgaeSVWqEnBi14RpLj7Gs50WFaAuIt0zb7EoydM2XSx2gE/M6xe5z5RUt8OocclSgLMcqb1Zy16jdIGUJYbPMrTFYGwNEgeXP8yFHMI998LpBPuqXbsGSjJelKKJQQsDx+PByn3wll6kEYQdCSaHpe3J7ahayXcvIHqprk9nsRXkHpidPHjXv2aPBzJDGTi4V30tyswwyfxpat7y8USTmCjltZqC29a2q0cTpBxUHZmolpU1EPmY2wIuVu8bK/knkIy8V9tfjE19SusHvu0vqREmFjfFzaMsRSQiNeHk3moAZuy/XPY5p3aD05/ICeYrtSoSeZ+zoAm90ZgoC67DMt/tEs0SI3m4c/eis/AtNK9XhKy+zGfHm7tomPwoJyzLOuIQUoPz6tmUKaAD6Vr+L6Jxj2Bs1OPi3IE7vWrQxlSZdUyae6cDrMQEkVmmTqsytOl7jDA/8RziaxQiYWf8F2J4pMH</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &UploadScript;
      &ImportVoucherScript;
    </text>
  </script>

  <response>
    <action id="GetTicket">
      <text>
        &UploadCreateTicket;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfz6e414K5THbJPKTpTCXK/0Soy/gsPLzbDunHmOYjOYz5znFkiGNhRte4WM40R4ZHA==</encrypted>]]>
      </text>
    </action>
  </response>

  &UploadButtonCss;
</dir>