import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:figma_to_flutter/common/resources/app_color.dart';
import 'package:figma_to_flutter/common/resources/app_strings.dart';
import 'package:figma_to_flutter/common/resources/assets.dart';
import 'package:figma_to_flutter/common/widgets/common_widgets.dart';


class FillChecklistScreen extends StatelessWidget {
  const FillChecklistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: AppColor.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        body: SafeArea(
          top: false,
          child: CustomScrollView(
            slivers: [
              _buildSliverAppBar(context),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    children: [
                      SizedBox(height: 16.h),
                      _buildProductInfo(),
                      SizedBox(height: 16.h),
                      _buildCustomerAndObjectInfo(),
                      SizedBox(height: 16.h),
                      _buildGeneralInfoSection(),
                       SizedBox(height: 12.h),
                      _buildActionButtons(),
                      SizedBox(height: 24.h),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSliverAppBar(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 162.h,
      pinned: true,
      automaticallyImplyLeading: false,
      backgroundColor: AppColor.primaryColor,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              Assets.checklistBg,
              fit: BoxFit.cover,
            ),
            Container(
              color: AppColor.textSecondary.withOpacity(0.12),
            ),
          ],
        ),
        titlePadding: EdgeInsets.only(left: 20.w, bottom: 16.h, right: 20.w),
        title: Row(
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                padding: EdgeInsets.all(6.r),
                decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Icon(
                  Icons.arrow_back_ios_new,
                  size: 24.r,
                  color: AppColor.textHint,
                ),
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Text(
                    AppStrings.fillChecklistSubtitle,
                    style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500, color: AppColor.white.withOpacity(0.8)),
                  ),
                   Text(
                    AppStrings.fillChecklistTitle,
                    style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold, color: AppColor.white),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductInfo() {
    return Container(
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: AppColor.textSecondary.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Row(
        children: [
          Image.network(Assets.product, width: 70.w, height: 70.h),
          SizedBox(width: 12.w),
          Expanded(
            child: Text(
              'HVAC System - Model A200',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: AppColor.textPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCustomerAndObjectInfo() {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: _InfoColumn(
                title: AppStrings.customer,
                value: 'Mr. Marc Roset',
              ),
            ),
            SizedBox(width: 6.w),
            Expanded(
              child: _InfoColumn(
                title: AppStrings.company,
                value: 'Vitec Visual Private Limited Surat',
              ),
            ),
          ],
        ),
        SizedBox(height: 6.h),
        Row(
           crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: _InfoColumn(
                title: AppStrings.object,
                value: 'Vitec Visual Private Limited Surat',
              ),
            ),
            SizedBox(width: 6.w),
             Expanded(
              child: _InfoColumn(
                title: AppStrings.address,
                value: '2nd Floor, Laxmi Enclave 1,Katargam, Surat 395004, India',
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildGeneralInfoSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 16.h),
         CustomTextField(
          title: AppStrings.contractNumber,
          hintText: "8975645623",
          additionalInfo: "This data is automatically generated to ensure accuracy, improve efficiency, and maintain error-free records—giving you a seamless experience.",
        ),
        SizedBox(height: 12.h),
        CustomTextField(
          title: AppStrings.additionalNotes,
          hintText: AppStrings.typeYourNotes,
           additionalInfo: AppStrings.notesHint,
        ),
        SizedBox(height: 12.h),
        CustomTextField(
          title: AppStrings.selectDateTime,
          hintText: "2024-03-15 , 14:30",
          additionalInfo: AppStrings.dateTimeHint,
          validationIcon: Assets.calendarIcon,
        ),
        SizedBox(height: 12.h),
        _buildDocumentUploadSection(),
        SizedBox(height: 12.h),
        _buildImageUploadSection(),
        SizedBox(height: 12.h),
         _buildSketchSection(),
         SizedBox(height: 12.h),
         _buildAudioSection(),
      ],
    );
  }

    Widget _buildActionButtons() {
    return Column(
      children: [
        SecondaryButton(text: AppStrings.saveAsDraft, onPressed: () {}),
        SizedBox(height: 12.h),
        PrimaryButton(text: AppStrings.completeChecklist, onPressed: () {}),
      ],
    );
  }

  Widget _buildDocumentUploadSection() {
    return _UploadContainer(
      title: 'Upload Documents',
      subtitle: 'Upload documents in this field if needed. Supported formats and size limits may apply. This field is optional.',
      child: Column(
        children: [
          SvgPicture.network("https://www.svgrepo.com/show/485590/upload-3.svg", width: 24.w, height: 24.h, colorFilter: const ColorFilter.mode(AppColor.textSecondary, BlendMode.srcIn),),
          SizedBox(height: 10.h),
           Text(
            'Upload Documents, Images, and Videos',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600, color: AppColor.textSecondary),
          ),
          SizedBox(height: 6.h),
          Text(
            'supported formats: PDF, JPG, PNG, MP4. \nMax file size: 20MB per file.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12.sp, color: AppColor.textHint),
          ),
          SizedBox(height: 10.h),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColor.primaryColor,
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
            ),
            child: Text(
              'Upload File',
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600, color: AppColor.textPrimary),
            ),
          ),
        ],
      ),
    );
  }

   Widget _buildImageUploadSection() {
    return _UploadContainer(
      title: 'Upload Image',
      subtitle: 'You can either capture a new image using the camera or upload an existing one from your device. Ensure the image meets the supported formats and size limits. This field is optional.',
      child: Column(
        children: [
           SvgPicture.network("https://www.svgrepo.com/show/485590/upload-3.svg", width: 24.w, height: 24.h, colorFilter: const ColorFilter.mode(AppColor.textSecondary, BlendMode.srcIn),),
          SizedBox(height: 10.h),
          Text(
            'Capture or Upload an Image and Edit',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600, color: AppColor.textSecondary),
          ),
          SizedBox(height: 6.h),
          Text(
            'Supported formats: JPG, PNG. \nMax file size: 10MB per image.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12.sp, color: AppColor.textHint),
          ),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton(onPressed: (){}, child: Text('Take A Photo', style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600, color: AppColor.textPrimary)),),
              SizedBox(width: 6.w),
              ElevatedButton(onPressed: (){}, child: Text('Select From Gallery',style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600, color: AppColor.textPrimary)), style: ElevatedButton.styleFrom(backgroundColor: AppColor.primaryColor),),
            ],
          )
        ],
      ),
    );
  }
   Widget _buildSketchSection() {
    return _UploadContainer(
      title: 'Upload Drawing As A Sketch',
      subtitle: 'You can either draw a sketch directly using the built-in drawing tool or upload an existing sketch from your device. If uploading, ensure the file meets the supported formats and size limits. This field is optional and can be used to provide additional visual details.',
      child: Column(
        children: [
            SvgPicture.network("https://www.svgrepo.com/show/485590/upload-3.svg", width: 24.w, height: 24.h, colorFilter: const ColorFilter.mode(AppColor.textSecondary, BlendMode.srcIn),),
          SizedBox(height: 10.h),
          Text(
            'Draw or Upload a Hand-Drawn Sketch',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600, color: AppColor.textSecondary),
          ),
          SizedBox(height: 6.h),
          Text(
            'JPG, PNG. \nMax file size: 5MB per sketch.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12.sp, color: AppColor.textHint),
          ),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             OutlinedButton(onPressed: (){}, child: Text('Draw A Sketch', style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600, color: AppColor.textPrimary)),),
              SizedBox(width: 6.w),
              ElevatedButton(onPressed: (){}, child: Text('Upload Sketch',style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600, color: AppColor.textPrimary)), style: ElevatedButton.styleFrom(backgroundColor: AppColor.primaryColor),),
            ],
          )
        ],
      ),
    );
  }

   Widget _buildAudioSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Row(
          children: [
            Text(
              "Audio Recording",
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: AppColor.textHint,
              ),
            ),
          ],
        ),
        SizedBox(height: 3.h),
        Text(
          "Record an audio clip directly in this field. This field is optional and can be used to provide additional details.",
          style: TextStyle(
            fontSize: 12.sp,
            color: AppColor.textHint,
          ),
        ),
        SizedBox(height: 12.h),
        Container(
          padding: EdgeInsets.all(12.r),
          decoration: BoxDecoration(
            color: AppColor.white,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Row(
            children: [
              Expanded(child: Image.network("https://i.imgur.com/k9Q6E9r.png", height: 61.h, fit: BoxFit.fitWidth,)),
              SizedBox(width: 12.w,),
              Container(
                padding: EdgeInsets.all(4.r),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColor.white,
                ),
                child: Icon(Icons.mic, color: AppColor.textSecondary, size: 24.r,),
              ),
            ],
          ),
        )
      ],
    );
  }

}

class _InfoColumn extends StatelessWidget {
  final String title;
  final String value;

  const _InfoColumn({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 12.sp, color: AppColor.textPrimary),
        ),
        SizedBox(height: 2.h),
        Text(
          value,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: AppColor.textSecondary,
          ),
        ),
      ],
    );
  }
}

class _UploadContainer extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget child;

  const _UploadContainer({required this.title, required this.subtitle, required this.child});
  
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: AppColor.textHint,
              ),
            ),
          ],
        ),
        SizedBox(height: 3.h),
        Text(
          subtitle,
          style: TextStyle(
            fontSize: 12.sp,
            color: AppColor.textHint,
          ),
        ),
        SizedBox(height: 12.h),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 10.w),
           decoration: BoxDecoration(
            color: const Color(0xFFEEF2F5),
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: AppColor.textSecondary, width: 1, style: BorderStyle.solid),
          ),
          child: child,
        ),
      ],
    );
  }
}